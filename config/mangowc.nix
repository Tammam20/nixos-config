{ config, pkgs, ... }:

{
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    foot
    wmenu
    wl-clipboard
    grim
    slurp
    swaybg
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

