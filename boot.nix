{ config, pkgs, lib, ... }:

{
  # Kernel Parameters
  boot.kernelParams = [ "intel_pstate=disable" "intel_iommu=on" "iommu=pt" "nosgx" ];
  
  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Show plymoth splash screen when booting:
  #boot.plymouth.enable = true;
}
