{ config, pkgs, lib, ...}:

{
  # Enable KDE Desktop Environment
  services.xserver.displayManager.sddm = { 
    enable = true;
  };

  services.xserver.desktopManager.plasma6.enable = true;

  # Fix scaling in xorg
  services.xserver.dpi = 192;


  # Packages for KDE
  environment.systemPackages = with pkgs; [ 
  glib
  #kde-rounded-corners
  epiphany
  kdePackages.discover
  kdePackages.kate
  kdePackages.kmail
  kdePackages.kweather
  gnome.dconf-editor
  gnome.gnome-maps
  maliit-keyboard
  maliit-framework
  kdePackages.plasma-welcome
  ];
  
  # Fix accessiblity issues
  services.gnome.at-spi2-core.enable = true;

  # Glib 
  services.gnome.glib-networking.enable = true;

  # Enable Bluetooth in KDE
  hardware.bluetooth.enable = true;

  # Enable KDE Partition Manager
  programs.partition-manager.enable = true;

  # Enable KDE Connect
  programs.kdeconnect.enable = true;

  # Disable Hibernate
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.login1.hibernate" ||
            action.id == "org.freedesktop.login1.hibernate-multiple-sessions")
        {
            return polkit.Result.NO;
        }
    });
  '';
 
}
