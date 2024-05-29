{ config, pkgs, lib, ... }:
{  
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.dpi = 192;

  # Polkit
  security.polkit.enable = true;

  # Fix on a service
  services.tumbler.enable = true;

  # Add credential support
  services.gnome.gnome-keyring.enable = true;  

  # Enable Gluetooth support
  hardware.bluetooth.enable = true; 
  services.blueman.enable = true;


  # Hyprland Config:
  programs.hyprland.enable = true;

  # fix an error 
  services.gvfs.enable = true;
  

  # fix error The name org.a11y.Bus was not provided by any .service files
  services.gnome.at-spi2-core.enable = true;  

  # Fix error at waybar
  /* nixpkgs.overlays = [
   (self: super: {
     waybar = super.waybar.overrideAttrs (oldAttrs: {
       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];*/

  # Enable MPD, the music player daemon.
  services.mpd.enable = true;
  
  # Enable volume and capture control with keyboard media keys.
  sound.mediaKeys.enable = true;

  # some packages for hyprland
  environment.systemPackages = with pkgs; [
   libsForQt5.dolphin
   rofi-wayland
   dunst
   wev
   swaylock-effects
   swayidle
   waybar
   gthumb
   hyprpaper
   brightnessctl
   cliphist
   gnome.gnome-keyring
   wl-clipboard
   wl-clip-persist
   udiskie
   grim
   slurp
   playerctl
   pavucontrol
   wl-color-picker
   libsForQt5.kde-cli-tools # fix an error with qt kde apps
   networkmanagerapplet
   htop
   kitty
   lxqt.lxqt-policykit
   papirus-icon-theme
   libsForQt5.breeze-gtk
  ];  

  # THUNAR
  programs.thunar.enable = true;

  # fix swaylock does not work
    security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';

  # Fix qt apps in hyprland:
  qt = {
  enable = true;
  platformTheme = "kde";
  };

  services.xserver.desktopManager.plasma5.useQtScaling = true;
}
