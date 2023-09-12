# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ ./hardware-configuration.nix # Include the results of the hardware scan.
      ./nvidia.nix
      ./avp.nix
      ./services.nix
      ./packages.nix	      
      ./system.nix
      ./networking.nix
      ./locale.nix
      ./boot.nix
      ./users.nix
      ./sb.nix
    ];

  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable/";

}
