{ config, pkgs, lib, inputs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  hardware.bluetooth.enable = true;
}
