{ pkgs, ... }:

{
  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Cosmic de
#  services.desktopManager.cosmic.enable = true;
 # services.desktopManager.cosmic.xwayland.enable = true;  

  environment.systemPackages = with pkgs; [
  gnome-firmware
  dconf-editor 
  gnome-software
  gnome-tweaks
  usbmuxd
  libimobiledevice
  filezilla
  ifuse
  ];
  #  programs.kdeconnect = {
#  enable = true;
#  package = pkgs.gnomeExtensions.gsconnect;
#};
  #programs.steam.gamescopeSession.enable = true;
}
