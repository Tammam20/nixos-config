{ config, pkgs, lib, ... }:

{
  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
  gnome-firmware
  gnome.dconf-editor 
  gnome.gnome-software
  gnome.gnome-tweaks
  ];
}
