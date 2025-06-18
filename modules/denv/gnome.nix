{ config, pkgs, lib, ... }:

{
  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
  gnome-firmware
  dconf-editor 
  gnome-software
  gnome-tweaks
  ];
  programs.steam.gamescopeSession.enable = true;
}
