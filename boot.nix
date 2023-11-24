{ config, pkgs, lib, ... }:

{
  # Kernel Parameters
  boot.kernelParams = [ "intel_pstate=disable" "intel_iommu=on" "iommu=pt" "nosgx" ];
  
  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;

  # To enable systemd-boot without secure-boot support
  boot.loader.systemd-boot.enable = true;

  # To enable systemd with secure-boot support
  #boot.loader.systemd-boot.enable = lib.mkForce false;

  # Enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Show plymoth splash screen when booting:
  #boot.plymouth.enable = true;
}
