{ config, pkgs, lib, ... }:

{
  # List services that you want to change:

  # Manage System
  services.meshcentral.enable = true;

  # Enable the OpenSSH daemon
  services.openssh.enable = true;
  
  # Power management:
  services.auto-cpufreq.enable = true; # Enable auto-cpufreq service
 
  services.thermald.enable = true; # Enable thermald for improved efficiency 

  services.thermald.package = pkgs.thermald.overrideAttrs (old: {
  patches = (old.patches or [] ) ++ [(builtins.fetchurl "https://patch-diff.githubusercontent.com/raw/intel/thermal_daemon/pull/422.patch")];
  });

  services.power-profiles-daemon.enable = false; # Disable Power Profiles
  
  services.acpid.enable = true; # Enable ACPI daemon

  # Virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.podman.enable = true;

  # Firmware
  services.fwupd.enable = true;

  # Enable Trusted Platform Module 2 support.
  security.tpm2.enable = true;
  security.tpm2.abrmd.enable = true;

  # Enable Flatpak support
  services.flatpak.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us,ara";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  #hardware.pulseaudio.enable = true;
  services.pipewire.enable = true;
  services.pipewire.systemWide = true; # Enable PipeWire system wide
  services.pipewire.pulse.enable = true; # Enable PulseAudio server emulation.
  services.pipewire.wireplumber.enable = true; # Enable Wireplumber, a modular session / policy manager for PipeWire 
  services.pipewire.alsa.enable = true; # Enable ALSA support.
  services.pipewire.alsa.support32Bit = true; # Enable 32-bit ALSA support on 64-bit systems.
  #security.rtkit.enable = true; # Enable the RealtimeKit system service
  
  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # Enable all firmware
  hardware.enableAllFirmware = true;
  
  # Enable microcode updates for intel cpus
  #hardware.cpu.intel.updateMicrocode = true;

}
