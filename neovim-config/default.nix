{ pkgs }:

let
  vimrc = import ./vimrc.nix;
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [
      # File tree
      nerdtree
      vim-nerdtree-tabs
      vim-nerdtree-git-plugin
      vim-devicons
      vim-nerdtree-syntax-highlight

      # Utils
      vim-easymotion
      vim-mru
      vim-editorconfig
      vim-emmet

      # Git
      vim-fugitive

      # Airline
      vim-airline
      vim-airline-themes

      # Themes
      colibri-vim
      gruvbox
      vim-jellybeans

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
