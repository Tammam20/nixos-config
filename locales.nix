{ flake.nixosModules.locales = { pkgs, ... }: {
 # Set your time zone.
  time.timeZone = "Asia/Baghdad";

  # Locales
  i18n.defaultLocale = "en_US.UTF-8";

# fonts
fonts.fontconfig.defaultFonts.monospace = ["JetBrainsMono Nerd Font Mono"];
fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  fonts.enableDefaultPackages = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de,ara";
    variant = "nodeadkeys";
  };
  console.useXkbConfig = true;
};
}
