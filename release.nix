let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {
    overlays = [
      (import ./overlay.nix)
      (import ./overlaya.nix)
      (import ./overlayb.nix)
      (import ./overlayc.nix)
      (import ./overlayd.nix)
      (import ./overlay-myapp.nix)
    ];
  };
in
{
  inherit (pkgs)
    liba
    libb
    libc
    libd
    myapp;
  myapp-static = pkgs.pkgsStatic.myapp;
  myapp-win64 = pkgs.pkgsCross.mingwW64.myapp;
  myapp-aarch64 = pkgs.pkgsCross.aarch64-multiplatform.myapp;

  devShell = pkgs.mkShell {
    inputsFrom = with pkgs; [ liba libb libc libd myapp ];
    nativeBuildInputs = [ pkgs.graphviz ];
  };
}
