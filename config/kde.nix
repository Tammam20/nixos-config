{ config, pkgs, lib, inputs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  hardware.bluetooth.enable = true;
  programs.kdeconnect = {
  enable = true;
};
programs.kde-pim.enable = true;
programs.partition-manager.enable = true;
environment.systemPackages =  with pkgs; [
kdePackages.kcalc
];
}
