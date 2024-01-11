{ config, pkgs, lib, ... }:
{
services.xserver.displayManager.lightdm.greeters.pantheon.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.dpi = 192; # Fix xorg scaling
services.xserver.desktopManager.pantheon.enable = true;
services.pantheon.apps.enable = true;
programs.pantheon-tweaks.enable = true;
}



