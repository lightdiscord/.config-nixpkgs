{ pkgs }:

let
  build = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {
  nerdtree = build {
    name = "nerdtree";
    src = pkgs.fetchgit {
      url = "https://github.com/scrooloose/nerdtree";
      rev = "b89de09810b646ec2107160db3af9e530d20446c";
      sha256 = "0saa3iqa5zfn4m61iq661dszq4fnqjgrhmigzx0r8s4cskglg3jc";
    };
    dependencies = [];
  };
}
