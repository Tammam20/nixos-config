{ config, pkgs, lib, ... }:

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
  (floorp.override  { nativeMessagingHosts = [plasma-browser-integration];})
  thunderbird
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
  libreoffice-fresh
  apfs-fuse
  vim
  wget
  neovim
  tpm2-tools
  cron
  gimp
  rawtherapee
  clinfo
  glxinfo
  vulkan-tools
  wayland-utils
  distrobox
  ];

  # Packages with options
  programs.virt-manager.enable = true;
}
