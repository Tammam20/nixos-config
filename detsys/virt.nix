{
  flake.nixosModules.virt = {config, pkgs, ...}: {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      };
    virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };
  };
  }