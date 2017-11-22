{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    hyper = import ./hyper-config { inherit (pkgs) stdenv hyper fetchurl; };
    home-manager = import ./home-manager { inherit pkgs; };
  };
}
