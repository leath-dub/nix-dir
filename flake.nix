{
  description = "Simple flake for directories";

  outputs = { self }: let
    in {
      lib.rawDir = { src, pkgs }: derivation {
        name = "conf";

        builder = "${pkgs.busybox}/bin/busybox";
        args = [ "sh" ./builder.sh ];

        system = builtins.currentSystem;

        inherit (pkgs) busybox;
        inherit src;
      };
    };
}
