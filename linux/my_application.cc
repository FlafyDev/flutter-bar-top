#include "my_application.h"
#include <map>

#include <flutter_linux/flutter_linux.h>
#include <gtk-layer-shell/gtk-layer-shell.h>

#include "flutter/generated_plugin_registrant.h"

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

static std::map<int, cairo_rectangle_int_t> mouse_regions = {};

static GtkWindow *window = nullptr;

static void respond(FlMethodCall *method_call, FlMethodResponse *response) {
  g_autoptr(GError) error = nullptr;
  if (!fl_method_call_respond(method_call, response, &error)) {
    g_warning("Failed to send method call response: %s", error->message);
  }
}

static void apply_mouse_regions() {
  cairo_region_t *final_region = cairo_region_create();

  for (const auto& entry : mouse_regions) {
    cairo_region_t *region = cairo_region_create_rectangle(&entry.second);
    cairo_region_union(final_region, region);
    cairo_region_destroy(region);
  }

  gtk_widget_input_shape_combine_region(GTK_WIDGET (window), final_region);
  cairo_region_destroy(final_region);
}

static void method_call_cb(FlMethodChannel *channel, FlMethodCall *method_call, gpointer user_data) {
  const gchar *method = fl_method_call_get_name(method_call);
  FlValue *args = fl_method_call_get_args(method_call);

  if (strcmp(method, "set_input") == 0) {
    bool recieve = fl_value_get_bool(fl_value_lookup_string(args, "recieve"));

    gtk_layer_set_keyboard_interactivity(window, recieve ? GTK_LAYER_SHELL_KEYBOARD_MODE_EXCLUSIVE : GTK_LAYER_SHELL_KEYBOARD_MODE_NONE);

    g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_null()));
    respond(method_call, response);
    return;
  }

  if (strcmp(method, "add_mouse_region") == 0) {
    int id = fl_value_get_int(fl_value_lookup_string(args, "id"));
    int x = fl_value_get_int(fl_value_lookup_string(args, "x"));
    int y = fl_value_get_int(fl_value_lookup_string(args, "y"));
    int width = fl_value_get_int(fl_value_lookup_string(args, "width"));
    int height = fl_value_get_int(fl_value_lookup_string(args, "height"));

    cairo_rectangle_int_t rect = { x, y, width, height };

    mouse_regions[id] = rect;

    apply_mouse_regions();

    g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_null()));
    respond(method_call, response);
    return;
  }

  if (strcmp(method, "remove_mouse_region") == 0) {
    int id = fl_value_get_int(fl_value_lookup_string(args, "id"));

    mouse_regions.erase(id);

    apply_mouse_regions();

    g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_null()));
    respond(method_call, response);
    return;
  }

  if (strcmp(method, "clear_mouse_regions") == 0) {
    mouse_regions.clear();

    apply_mouse_regions();

    g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_null()));
    respond(method_call, response);
    return;
  }

  g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  g_autoptr(GError) error = nullptr;
  fl_method_call_respond(method_call, response, &error);
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  window = GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));

  gtk_layer_init_for_window(window);
  gtk_layer_set_namespace(window, "flutter_background_bar");
  gtk_layer_set_keyboard_mode(window, GTK_LAYER_SHELL_KEYBOARD_MODE_NONE);
  gtk_layer_set_layer(window, GTK_LAYER_SHELL_LAYER_TOP);
  // gtk_layer_set_anchor(window, GTK_LAYER_SHELL_EDGE_BOTTOM, TRUE);
  gtk_widget_set_size_request(GTK_WIDGET(window), 1920, 1080);

  gboolean use_header_bar = FALSE;
  if (use_header_bar) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "flutter_background_bar");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "flutter_background_bar");
  }

  GdkScreen* gdkScreen;
  GdkVisual* visual;
  gtk_widget_set_app_paintable(GTK_WIDGET(window), TRUE);
  gdkScreen = gdk_screen_get_default();
  visual = gdk_screen_get_rgba_visual(gdkScreen);
  if (visual != NULL && gdk_screen_is_composited(gdkScreen)) {
    gtk_widget_set_visual(GTK_WIDGET(window), visual);
  }

  gtk_window_set_default_size(window, 1, 1);
  gtk_widget_show(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  FlEngine *engine = fl_view_get_engine(view);
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlBinaryMessenger) messenger = fl_engine_get_binary_messenger(engine);
  g_autoptr(FlMethodChannel) channel = fl_method_channel_new(messenger, "general", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(channel, method_call_cb, g_object_ref(view), g_object_unref);

  gtk_widget_grab_focus(GTK_WIDGET(view));

  // cairo_rectangle_int_t rect = { 0, 0, 200, 200 };
  //
  // mouse_regions[0] = rect;

  apply_mouse_regions();
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application, gchar*** arguments, int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
     g_warning("Failed to register: %s", error->message);
     *exit_status = 1;
     return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  return TRUE;
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line = my_application_local_command_line;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {}

MyApplication* my_application_new() {
  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID,
                                     "flags", G_APPLICATION_NON_UNIQUE,
                                     nullptr));
}
