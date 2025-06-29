{ /*config, pkgs, lib,*/ ... }:

{

  # Set your time zone.
  time.timeZone = "Asia/Baghdad";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_IQ.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "ar_IQ.UTF-8";
    LC_MONETARY = "ar_IQ.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "ar_IQ.UTF-8";
    LC_PAPER = "ar_IQ.UTF-8";
    LC_TELEPHONE = "ar_IQ.UTF-8";
    LC_TIME = "ar_IQ.UTF-8";
  };
  i18n.extraLocales = "all";
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de,ara";
    variant = "nodeadkeys";
  };
  
  # configure tty keymap
  console.useXkbConfig = true;
}
