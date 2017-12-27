{ pkgs, ... }:

let
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  neovim = pkgs.neovim.override { configure = (import ./neovim-config { inherit pkgs; }); };
  python3 = pkgs.python36.withPackages (ps: [ ps.numpy ps.editorconfig ]);
  python2 = pkgs.python27.withPackages (ps: [ ps.numpy ps.editorconfig ]);
  discord = pkgs.lib.overrideDerivation pkgs.discord (old: {
    version = "0.0.3";
    name = "discord-0.0.3";
    src = pkgs.fetchurl {
      url = "https://dl.discordapp.net/apps/linux/0.0.3/discord-0.0.3.tar.gz";
      sha256 = "1yxxy9q75zlgk1b4winw4zy9yxk5pn8x4camh52n6v3mw6gq0bfh";
    };
  });
  sysconfig = (import <nixpkgs/nixos> {}).config;
in
{
  home.packages = with pkgs; ([
    neovim
    htop
    tmux
    git
    gitAndTools.gitflow
    sshpass
    fortune
    ponysay
    wget
    tldr
    rustup
    nodejs-9_x
    gcc
    python3
    python2
    gnumake
    unzip
    unrar
    editorconfig-core-c
  ] ++ pkgs.lib.optionals sysconfig.services.xserver.enable [
    vscode
    discord
    tdesktop
    polybar
    rofi
    i3lock
    vlc
    alacritty
    gitkraken
    pavucontrol
    compton
    lxappearance
    psmisc
    ffmpeg
    gst-ffmpeg
    hal-flash
    openh264
    x264
    firefox-devedition-bin
    chromium
    tor
    torsocks
    tor-arm
    tor-browser-bundle-bin
    gimp
    inkscape
  ]);

  gtk = import ./programs-config/gtk.nix { inherit pkgs; };

  programs.git = import ./programs-config/git.nix;

  services.gpg-agent = import ./services-config/gpg-agent.nix;

  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };
}
