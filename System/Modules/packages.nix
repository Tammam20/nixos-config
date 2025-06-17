{ config, pkgs, lib, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
  (floorp.override  { nativeMessagingHosts = [ gnome-browser-connector /*plasma-browser-integration*/ ];})
  thunderbird
  telegram-desktop
  python3Full
  fish
  chromium
  appimage-run
  git
  pciutils
  usbutils
  lshw
  cpufetch
  neofetch
  libreoffice
  vim
  wget
  cron
  distrobox
  ];

  # Packages with options
  programs.git.enable = true;

  # 

}
