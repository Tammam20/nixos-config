{ config, pkgs, lib, ...}:

{
  # Enable KDE Desktop Environment
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Fix scaling in xorg
  services.xserver.dpi = 192;


  # Packages for KDE
  environment.systemPackages = with pkgs; [ 
  glib
  #kde-rounded-corners
  epiphany
  libsForQt5.discover
  libsForQt5.kate
  libsForQt5.kmail
  libsForQt5.kweather
  gnome.dconf-editor
  gnome.gnome-maps
  maliit-keyboard
  maliit-framework
  gsettings-desktop-schemas
  libsForQt5.plasma-welcome
  netsurf.browser
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
 
   # Fonts 
   fonts.packages = with pkgs; [
    noto-fonts
    nerdfonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    corefonts
    vistafonts
    vistafonts-cht
    vistafonts-chs
   ]; 
}
