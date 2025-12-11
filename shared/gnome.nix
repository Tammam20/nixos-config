{ /*config,*/ pkgs, /*lib, inputs,*/ ... }:

{
  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
  gnome-firmware
  dconf-editor 
  gnome-software
  gnome-tweaks
  ];
  #programs.steam.gamescopeSession.enable = true;
}
