{ config, pkgs, lib, ... }:

{
 
   # Fonts 
    fonts.packages = with pkgs; [
    noto-fonts
    nerdfonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
    corefonts
    vistafonts
    vistafonts-cht
    vistafonts-chs
    ];
    
   # Default fonts
    fonts.fontconfig.defaultFonts = {
    serif = [ "Noto Serif" "Source Han Serif" ];
    sansSerif = [ "Noto Sans" "Source Han Sans" ];
    }; 

  # Set your time zone.
  time.timeZone = "Asia/Baghdad";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
   
}
