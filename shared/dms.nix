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

niri = {
    enableKeybinds = true;   # Sets static preset keybinds
    enableSpawn = true;      # Auto-start DMS with niri and cliphist, if enabled
  };
};
programs.niri.enable = true;
programs.dankMaterialShell.greeter = {
  enable = true;
  compositor.name = "niri";  # Or "hyprland" or "sway"
};
services.upower.enable = true;
hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = false;
}
