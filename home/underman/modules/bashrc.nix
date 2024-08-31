{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      FLAKE = "/home/underman/Dotfiles/";
    };
    shellAliases = {
      ".." = "cd ..";
      l = "ls --color=auto";
      la = "ls -A --color=auto";
      ll = "ls -l --color=auto";
      lal = "ls -Al --color=auto";
      lla = "ls -lA --color=auto";
      rebooty = "reboot";
      off = "poweroff";
    };
  };
}
