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
  ];

  # Packages with options
  programs.git = {
  enable = true;
  config = {
  user = {
	email = "whymewhyalwaysme@protonmail.com";
	name = "Tammam20"; };
};
  };
  
  programs.chromium.enable = true;
  programs.thunderbird.enable = true;
  programs.firefox.enable = true;

}
