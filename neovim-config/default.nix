{ pkgs }:

let
  vimrc = import ./vimrc.nix;
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [
      # File tree
      nerdtree

      # Utils
      vim-easymotion

      # Themes
      colibri-vim
      gruvbox

      # Languages
      vim-javascript
      vim-vue
      rust-vim
      vim-nix
      vim-graphql
      vim-toml
      vim-fish
    ];
    opt = [];
  };

  customRC = vimrc;
}
