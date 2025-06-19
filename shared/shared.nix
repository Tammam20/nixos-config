# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
      
{ config, pkgs, lib, inputs, ... }:
      
{
  imports = [
      # Universal Options:
      ./services.nix # Services
      ./packages.nix # NixPkgs
      ./users.nix # Users
      ./locales.nix # Fonts & Locales
      ./denv/gnome.nix # gnome desktop environment
    ];
  # bootable system
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["nowatchdog"];
  #boot.loader.systemd-boot.enable = true;
  
  # system stuff
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = true;
  services.fwupd.enable = true;

  # Optimising the Nix store
  nix.settings.auto-optimise-store = true;

  nix = {
  gc = {
    automatic = true; 
    dates = "daily"; 
    options = "--delete-older-than 2d";
  };
};
      
  # Enable nix-command and flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

      
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
      
}
