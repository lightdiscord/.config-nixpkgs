{ pkgs, ... }:

let
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  neovim = pkgs.neovim.override { configure = (import ./neovim-config { inherit pkgs; }); };
  hyper = import ./hyper-config { inherit (pkgs) stdenv hyper fetchurl; };
  python3 = pkgs.python36.withPackages (ps: [ ps.numpy ps.editorconfig ]);
  python2 = pkgs.python27.withPackages (ps: [ ps.numpy ps.editorconfig ]);
  flashplayer = pkgs.lib.overrideDerivation pkgs.flashplayer (old: {
    src = pkgs.fetchurl {
      url = "https://fpdownload.adobe.com/get/flashplayer/pdc/27.0.0.187/flash_player_npapi_linux.x86_64.tar.gz";
      sha256 = "1hfcphcvdam62k983rm6r42mnkih4nfwyrnx0v88z3nw14mjr4c3";
    };
  });
  discord = pkgs.lib.overrideDerivation pkgs.discord (old: {
    version = "0.0.3";
    name = "discord-0.0.3";
    src = pkgs.fetchurl {
      url = "https://dl.discordapp.net/apps/linux/0.0.3/discord-0.0.3.tar.gz";
      sha256 = "1yxxy9q75zlgk1b4winw4zy9yxk5pn8x4camh52n6v3mw6gq0bfh";
    };
  });
in
{
  home.packages = with pkgs; [
    neovim
    htop
    tmux

    # Git
    git
    gitAndTools.gitflow
    gitkraken

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

    # Medias
    vlc

    # Terminal
    hyper
    alacritty

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
    
    # Browsers
    firefox-devedition-bin
    chromium
    tor
    torsocks
    tor-arm
    tor-browser-bundle-bin

    compton
    lxappearance
    psmisc
    ffmpeg
    gst-ffmpeg
    hal-flash
    openh264
    x264
    flashplayer
    editorconfig-core-c

    # Image editor
    gimp
    inkscape
  ];

  gtk = import ./programs-config/gtk.nix { inherit pkgs; };

  programs.git = import ./programs-config/git.nix;

  services.gpg-agent = import ./services-config/gpg-agent.nix;

  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };
}
