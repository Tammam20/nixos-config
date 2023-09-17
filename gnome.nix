{ config, pkgs, lib, ... }:

{
  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
  gnome.gnome-tweaks
  gnomeExtensions.pano
  gnomeExtensions.appindicator
  gnome.gnome-software
  gnomeExtensions.caffeine
  gnome-firmware
  gnome.dconf-editor
  ];
}
