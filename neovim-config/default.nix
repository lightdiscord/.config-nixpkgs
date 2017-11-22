{ pkgs }:

let
  vimrc = pkgs.callPackage ./vimrc.nix { };
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [ nerdtree ];
    opt = [];
  };

  customRC = vimrc;
}
