{ config, pkgs, lib, ... }:
{
  services.xserver.displayManager.lightdm.enable = true; # Enable Lightdm
  services.xserver.displayManager.lightdm.greeters.pantheon.enable = true; # Set lightdm theme
  services.xserver.desktopManager.deepin.enable = true; # Enable Deepin Desktop Environment
  services.xserver.dpi = 192; # Fix xorg scaling
  programs.dconf.enable = true; # Fix 
  
  
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
