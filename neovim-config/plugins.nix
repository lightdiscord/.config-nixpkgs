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
  colibri-vim = build {
    name = "colibri-vim";
    src = pkgs.fetchgit {
      url = "https://github.com/archSeer/colibri.vim";
      rev = "fd74cec1c0933704413896dfd6b4a5009b8f5191";
      sha256 = "0pcr23ibsyx2i1mvj7z3wz0kg231mby56j033s79lhfznai3masf";
    };
  };
  vim-javascript = build {
    name = "vim-javascript";
    src = pkgs.fetchgit {
      url = "https://github.com/pangloss/vim-javascript";
      rev = "a0e1442d86a070331c800107fbee6394ee6d3d08";
      sha256 = "1rlh444a0n4jvwiqdcpd905nk28rm8mn29jsnhs27pwsqqmpqll3";
    };
  };
  vim-vue = build {
    name = "vim-vue";
    src = pkgs.fetchgit {
      url = "https://github.com/posva/vim-vue";
      rev = "db295dbf134392d2328bf246f4bea9c3685573ad";
      sha256 = "1dax20d2kxrfj4hdvazcfk93xnw4icck52ba9fmaxr9bcq0k7n91";
    };
  };
  vim-graphql = build {
    name = "vim-graphql";
    src = pkgs.fetchgit {
      url = "https://github.com/jparise/vim-graphql";
      rev = "123230760fe915bedc6bc26c38ad673085163a7e";
      sha256 = "079gl2yw7nr80hpd2kxrzj0qm2706p41g0plv6la1dxafavrpnrb";
    };
  };
}
