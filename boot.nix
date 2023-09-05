{ config, pkgs, lib, ... }:

{
  # Kernel Parameters
  boot.kernelParams = [ "intel_pstate=disable" "intel_iommu=on" "iommu=pt" "nosgx" ];
  
  # Bootloader
  #boot.loader.systemd-boot.enable = lib.mkForce false;
 
  boot.loader.systemd-boot.enable = true;

  # Enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Show plymoth splash screen when booting:
  boot.plymouth.enable = true;
}
