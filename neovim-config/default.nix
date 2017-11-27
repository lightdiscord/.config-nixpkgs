{ pkgs }:

let
  vimrc = import ./vimrc.nix;
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [
      nerdtree
      colibri-vim
      gruvbox

      # Languages
      vim-javascript
      vim-vue
      rust-vim
      vim-nix
      vim-graphql
      vim-toml
    ];
    opt = [];
  };

  customRC = vimrc;
}
