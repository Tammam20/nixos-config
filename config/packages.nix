{ pkgs, ... }:

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
  python3
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
  nixfmt
  nil
  lm_sensors
  cmatrix
  tldr
  waydroid-helper
  kitty
  lutris
  qbittorrent
 # pkgsi686Linux.gperftools
  ];

  # Packages with options
  programs.chromium.enable = true;
  programs.thunderbird.enable = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;
 # services.qbittorrent.enable = true;
/*  services.qbittorrent.serverConfig = {
  LegalNotice.Accepted = true;
  Preferences = {
    WebUI = {
      Username = "tammam";
      Password_PBKDF2 = "@ByteArray(ARQ77eY1NUZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9b3b7uB8NR1Gur2hmQCvCDpm39Q+PsJRJPaCU51dEiz+dTzh8qbPsL8WkFljQYFQ==)";
    };
    General.Locale = "en";
  };

};*/
#  programs.steam.protontricks.enable = true;

#  programs.kdeconnect = {
#  enable = true;
#  package = pkgs.gnomeExtensions.gsconnect;
#};
 programs.git.enable = true;
# programs.ladybird.enable = true;
# programs.nix-ld.enable = true; 


}
