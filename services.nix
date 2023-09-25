{ config, pkgs, lib, ... }:

{
  # List services that you want to enable:

  # Enable the OpenSSH daemon
  services.openssh.enable = true;
  
  # Power management:
  services.auto-cpufreq.enable = true; # Enable auto-cpufreq service
 
  services.thermald.enable = true; # Enable thermald for improved efficiency 

  services.power-profiles-daemon.enable = false; # Disable Power Profiles

  # Enable libvirt and fix spice-gtk error
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Firmware
  services.fwupd.enable = true;

  # Enable Trusted Platform Module 2 support.
  security.tpm2.enable = true;
  security.tpm2.abrmd.enable = true;

  # Enable Flatpak support
  services.flatpak.enable = true;

  # Enable the X11 windowing system
  #services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  
  };
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;

}
