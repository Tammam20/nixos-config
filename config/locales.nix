{ ... }:

{

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
  i18n.extraLocales = "all";
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de,ara";
    variant = "nodeadkeys";
  };
#  services.kmscon.enable = true;
#  services.kmscon.hwRender = true;
 # services.kmscon.useXkbConfig = true;
  # configure tty keymap
  console.useXkbConfig = true;
}
