{...}:

{
  programs.git = {
    enable = true;
    userName = "LightDiscord";
    userEmail = "contact@lightdiscord.fr";
    signing = {
      key = "685CA08F30398537ACD08A53374A91189377ED82";
      signByDefault = true;
    };
    aliases = {
      "ls" = "log --graph --abbrev-commit --all --format=format:'%C(bold green)%h%C(reset) - %C(bold white)(%ar)%C(reset) %C(white)%s -%C(bold white) %an%C(reset)'";
    };
  };
}
