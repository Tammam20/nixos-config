{ config, pkgs, lib, ... }:

{

  # Enable lightdm as the display manager.
  services.xserver.displayManager.gdm.enable = true;

  services.xserver.enable = true;  
  security.polkit.enable = true;

  # Add credential support
  services.gnome.gnome-keyring.enable = true;  

  # Show battery status in gdm
  services.upower.enable = true;

  # Hyprland Config:
  programs.hyprland.enable = true;
  
  # fix some errors when using home-manager
  programs.dconf.enable = true;

  # some packages for hyprland
  environment.systemPackages = with pkgs; [
   rofi-wayland
   dunst
   wev
   swaylock
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

}
