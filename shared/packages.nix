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
  telegram-desktop
  chromium
  python3Full
  fish
  appimage-run
  pciutils
  usbutils
  lshw
  cpufetch
  fastfetch
  libreoffice
  vim
  gh
  chezmoi
  wget
  distrobox
  vscode-fhs
  nixfmt-rfc-style
  ];

  # Packages with options
  programs.chromium.enable = true;
  programs.thunderbird.enable = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;
}
