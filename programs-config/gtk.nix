{ pkgs }: 

{
  enable = true;
  theme = {
    package = pkgs.arc-theme;
    name = "Arc-Dark";
  };
  iconTheme = {
    package = pkgs.numix-icon-theme-square;
    name = "Numix-Square";
  };
}
