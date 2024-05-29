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
  qemu
  OVMFFull
  python3Full
  fish
  chromium
  appimage-run
  git
  pciutils
  usbutils
  lshw
  gcc
  cpufetch
  neofetch
  libnotify
  virtiofsd
  tor-browser-bundle-bin
  niv
  libreoffice
  apfs-fuse
  vim
  wget
  tpm2-tools
  cron
  gimp
  rawtherapee
  clinfo
  glxinfo
  vulkan-tools
  wayland-utils
  distrobox
  ripgrep-all
  ripgrep
  ];

  # Packages with options
  programs.virt-manager.enable = true;

}
