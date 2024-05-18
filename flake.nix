{
  description = "Frontend torrent client";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25865a40d14b3f9cf19f19b924e2ab4069b09588";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          self.overlays.default
        ];
      };
    in {
      packages = {
        # inherit (pkgs) flarrent;
        # default = pkgs.flarrent;
      };

      devShell = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          pkg-config
          flutter
          inotify-tools
          lsof
        ];
        buildInputs = with pkgs; [
          gtk-layer-shell
          cava
        ];
      };
    })
    // {
      overlays.default = _final: prev: {
        # flarrent = prev.callPackage ./nix/package.nix {};
      };
    };
}
