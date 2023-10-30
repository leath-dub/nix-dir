{
  description = "Simple flake for directories";

  outputs = { self }: let
    in {
      lib.rawDir = { src, pkgs, system }: derivation {
        name = "rawDir";

        builder = "${pkgs.busybox}/bin/busybox";
        args = [ "sh" ./builder.sh ];

        inherit (pkgs) busybox;
        inherit src;
        inherit system;
      };
    };
}
