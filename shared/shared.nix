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
      ./kde.nix
     # ./gnome.nix # gnome desktop environment
     #  ./dms.nix
    ];

  # Optimising the Nix store
  nix.settings.auto-optimise-store = true;

 # nix = {
 # gc = {
 #   automatic = true; 
 #   dates = "daily"; 
 #   options = "--delete-older-than 2d";
 # };
#};
      
  # Enable nix-command and flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
