# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
      
{ config, pkgs, lib, ... }:
      
{     
  imports =
    [ ./hardware-configuration.nix # Include the results of the hardware scan.
      
      # Universal Options:
      ./Modules/services.nix # Services
      ./Modules/packages.nix # NixPkgs
      ./Modules/users.nix # Users
      ./Modules/FontsLocales.nix # Fonts & Locales
      ./Modules/DesktopEnvironments/gnome.nix # gnome desktop environment
    ];
      
  # Optimising the Nix store
  nix.settings.auto-optimise-store = true;  
      
  # Enable nix-command and flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
  };

      
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
      
}     
