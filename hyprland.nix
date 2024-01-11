{ config, pkgs, lib, ... }:
{  
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";

  # Polkit
  security.polkit.enable = true;

  # Fix on a service
  services.tumbler.enable = true;

  # Add credential support
  services.gnome.gnome-keyring.enable = true;  

  # Enable Gluetooth support
  hardware.bluetooth.enable = true; 
  services.blueman.enable = true;

  # Show battery status in gdm
  services.upower.enable = true;

  # Hyprland Config:
  programs.hyprland.enable = true;

  # fix an error 
  services.gvfs.enable = true;
  
  # fix some errors when using home-manager
  programs.dconf.enable = true;

  # fix error The name org.a11y.Bus was not provided by any .service files
  services.gnome.at-spi2-core.enable = true;  

  # Fix error at waybar
  nixpkgs.overlays = [
   (self: super: {
     waybar = super.waybar.overrideAttrs (oldAttrs: {
       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  # Enable MPD, the music player daemon.
  services.mpd.enable = true;

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
   wl-clipboard
   wl-clip-persist
   udiskie
   grim
   slurp
   playerctl
   pavucontrol
   wl-color-picker
   python310Packages.keyring
   mate.mate-polkit
   libsForQt5.kde-cli-tools # fix an error with qt kde apps
   where-is-my-sddm-theme
   networkmanagerapplet
   htop
   kitty
  ];  

  # THUNAR
  programs.thunar.enable = true;

  # fix swaylock does not work
    security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';

  # fix Missing fonts on Xorg applications
    fonts.packages = with pkgs; [
      noto-fonts
      nerdfonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
    ];
   fonts.fontconfig.defaultFonts = {
    serif = [ "Noto Serif" "Source Han Serif" ];
    sansSerif = [ "Noto Sans" "Source Han Sans" ];
    };

  # Fix qt apps in hyprland:
  qt = {
  enable = true;
  platformTheme = "kde";
  };

  services.xserver.desktopManager.plasma5.useQtScaling = true;
}
