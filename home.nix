{ pkgs, ... }:

let
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  neovim = pkgs.neovim.override { configure = (import ./neovim-config { inherit pkgs; }); };
  hyper = import ./hyper-config { inherit (pkgs) stdenv hyper fetchurl; };
in
{
  home.packages = with pkgs; [
    neovim
    htop
    nodejs-9_x
    tmux
    git
    sshpass
    polybar
    rofi
    fortune
    vscode
    discord
    tdesktop
    ponysay
    wget
    i3lock
    hyper
    rustup
    unzip
    unrar
    redshift
    pavucontrol
    firefox-devedition-bin
    compton
    lxappearance
    psmisc
  ];

  gtk = import ./programs-config/gtk.nix { inherit pkgs; };

  programs.git = import ./programs-config/git.nix;

  services.redshift = import ./services-config/redshift.nix;

  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };
}
