{ pkgs, ... }:

let
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  neovim = pkgs.neovim.override { configure = (import ./neovim-config { inherit pkgs; }); };
  hyper = import ./hyper-config { inherit (pkgs) stdenv hyper fetchurl; };
  python3 = pkgs.python36.withPackages (ps: [ ps.numpy ]);
  python2 = pkgs.python27.withPackages (ps: [ ps.numpy ]);
in
{
  home.packages = with pkgs; [
    neovim
    htop
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

    # Documentation
    tldr

    # Compilers & Runtimes
    rustup
    nodejs-9_x
    gcc
    python3
    python2
    gnumake

    unzip
    unrar
    pavucontrol
    firefox-devedition-bin
    compton
    lxappearance
    psmisc
    ffmpeg
    gst-ffmpeg
  ];

  gtk = import ./programs-config/gtk.nix { inherit pkgs; };

  programs.git = import ./programs-config/git.nix;

  services.gpg-agent = import ./services-config/gpg-agent.nix;

  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };
}
