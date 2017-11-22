{ pkgs, ... }:

let
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
in
{
  home.packages = with pkgs; [
    neovim
    htop
    nodejs-9_x
    tmux
    arc-theme
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
    numix-icon-theme-square
    psmisc
  ];

  gtk = {
    enable = true;
    themeName = "Arc-Dark";
    iconThemeName = "Numix-Square";
  };

  programs.git = {
    enable = true;
    userName = "LightDiscord";
    userEmail = "contact@lightdiscord.fr";
    signing = {
      key = "2C811B29E5BA876E76283E4252BB9E642B4B24D2";
      signByDefault = true;
    };
  };

  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };
}
