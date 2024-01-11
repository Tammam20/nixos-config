{ config, pkgs, lib, ... }:

{
  #Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Kernel Parameters
  boot.kernelParams = [ /*"acpi=strict"*/ /*"intel_iommu=on"*/ /*"intel_iommu=igfx_off"*/ /*"iommu=pt"*/ /*iomem=relaxed"*/ "intel_pstate=disable" "nosgx" ];
  
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
