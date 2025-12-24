{ config, pkgs, lib, inputs, ... }:
{

programs.dankMaterialShell.enable = true;
programs.niri.enable = true;
programs.dankMaterialShell.greeter = {
  enable = true;
  compositor.name = "niri";  # Or "hyprland" or "sway"
};
services.upower.enable = true;
hardware.bluetooth.enable = true;
}
