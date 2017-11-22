{ stdenv, hyper, fetchurl }:

stdenv.lib.overrideDerivation hyper (oldAttrs: {
  version = "2.1.1";
  name = "hyper-2.1.1";
  src = fetchurl {
    url = "https://github.com/zeit/hyper/releases/download/2.1.1/hyper_2.1.1_amd64.deb";
    sha256 = "1znbadfzqvaa55y6wyd2hd5n12v2v4q4fbby3gp6z4s52rq7yq9l";
  };
})