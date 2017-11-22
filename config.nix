{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    home-manager = import ./home-manager { inherit pkgs; };
    hyper = pkgs.stdenv.lib.overrideDerivation pkgs.hyper (oldAttrs: {
      name = "hyper-2.1.1";
      version = "2.1.1";
      src = pkgs.fetchurl {
        url = "https://github.com/zeit/hyper/releases/download/2.1.1/hyper_2.1.1_amd64.deb";
	sha256 = "1znbadfzqvaa55y6wyd2hd5n12v2v4q4fbby3gp6z4s52rq7yq9l";
      };
    });
  };
}
