{ config, pkgs, lib, inputs, ... }:
{

programs.dankMaterialShell = {
  enable = true;

  systemd = {
    enable = true;             # Systemd service for auto-start
    restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
  };
  
  # Core features
  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  enableClipboard = true;            # Clipboard history manager
  enableVPN = true;                  # VPN management widget
  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  enableAudioWavelength = true;      # Audio visualizer (cava)
  enableCalendarEvents = true;       # Calendar integration (khal)
};
services.displayManager.dms-greeter = {
  enable = true;
  compositor.name = "niri";
  # Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
  configHome = "/home/tammam";

  # Custom config files for non-standard config locations
  configFiles = [
    "/home/tammam/.config/DankMaterialShell/settings.json"
  ];  # Or "hyprland" or "sway"
};  
programs.niri.enable = true;
services.upower.enable = true;
hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = false;

environment.systemPackages = with pkgs; [ 
    xwayland-satellite # xwayland support
];
}
