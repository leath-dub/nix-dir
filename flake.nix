{
  description = "Simple flake for directories";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, systems }: let
    in {
      templates.default = {
        lib.rawDir = src: derivation {
          name = "conf";

          builder = "${nixpkgs.busybox}/bin/busybox";
          args = [ "sh" ./builder.sh ];

          system = builtins.currentSystem;

          inherit (nixpkgs) busybox;
          inherit src;
        };
      };
  };
}
