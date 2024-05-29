{ config, pkgs, lib, ... }:

{
  # List services that you want to change:

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # Enable Flatpak support
  services.flatpak.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the headless Transmission BitTorrent daemon.
  services.transmission = {
  enable = true;
  #home = "/home/tammam/";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ara";
    variant = "";
  };

  # Change systemd timeout
  systemd.extraConfig = ''
  DefaultTimeoutStopSec=10s
  '';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  services.pipewire.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire.pulse.enable = true; # Enable PulseAudio server emulation.
  services.pipewire.wireplumber.enable = true; # Enable Wireplumber, a modular session / policy manager for PipeWire 
  services.pipewire.alsa.enable = true; # Enable ALSA support.
  services.pipewire.alsa.support32Bit = true; # Enable 32-bit ALSA support on 64-bit systems.
  security.rtkit.enable = true; # Enable the RealtimeKit system service
  
  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;


}
