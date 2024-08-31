{ config, pkgs, ... }:

{
  home.username = "underman";
  home.homeDirectory = "/home/underman";
  home.stateVersion = "24.05";

  home.packages = [

  ];

  home.file."~/.config" = {
    source = ./../../configs;
    recursive = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [ ./modules/default.nix ];
}
