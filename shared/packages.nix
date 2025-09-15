{ /*config,*/ pkgs, /*lib, inputs,*/ ... }:

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
  fastfetch
  libreoffice
  vim
  gh
  chezmoi
  wget
  distrobox
  vscode
  nixfmt-rfc-style
  nil
  lm_sensors
  spicetify-cli
  cmatrix
  tldr
  ];

  # Packages with options
  programs.chromium.enable = true;
  programs.thunderbird.enable = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.kdeconnect = {
  enable = true;
  package = pkgs.gnomeExtensions.gsconnect;
};
 programs.git.enable = true;
 programs.nix-ld.enable = true; 

  #virtualisation.sharedDirectories = {
  #  my-share = {
  #  source = "/path/to/be/shared";
  #  target = "//shared";
 # };
 # };
}
