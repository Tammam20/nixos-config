{ config, pkgs, lib, inputs, ... }:
{
  
programs.niri.enable = true;
services.upower.enable = true;
hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = false;

environment.systemPackages = with pkgs; [ 
    xwayland-satellite # xwayland support
];
}
