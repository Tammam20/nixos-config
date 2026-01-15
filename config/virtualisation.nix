{ pkgs, ... }:
{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.tpm.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };
}