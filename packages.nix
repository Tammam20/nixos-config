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
  qemu
  virt-manager
  OVMFFull
  auto-cpufreq
  python3Full
  vscode
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
  kitty
  tpm2-tools
  cron
  ];
}
