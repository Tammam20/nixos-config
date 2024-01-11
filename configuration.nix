# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ ./hardware-configuration.nix # Include the results of the hardware scan.
      #<home-manager/nixos> # Import Home Manager options
      ./nvidia.nix # NVIDIA Driver and NVIDIA PRIME
      ./avp.nix # Accelerated Video Playback
      ./services.nix # Manage Services
      ./packages.nix # Additional Nixos Packages
      ./system.nix # Some Nixos Options
      ./networking.nix # Manage Network
      ./locale.nix # Change Locales
      ./boot.nix # Enable Boot and Boot Options
      ./users.nix # Manage Users
      #./pantheon.nix # Enable Pantheon Desktop Environment
      ./kde.nix # Enable KDE Desktop Environment
      #./deepin.nix # Enable Deepin Desktop Environment
      #./gnome.nix # Enable gnome desktop environment
      #./hyprland.nix # Enable hyprland
      #./sb.nix # Secure Boot Support
    ];
}
