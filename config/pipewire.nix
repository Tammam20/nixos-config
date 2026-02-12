{ ... }:
{
  # pipewire
  services.pipewire.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire.jack.enable = true;
  services.pipewire.pulse.enable = true; # Enable PulseAudio server emulation.
  services.pipewire.wireplumber.enable = true; # Enable Wireplumber, a modular session / policy manager for PipeWire
  services.pipewire.alsa.enable = true; # Enable ALSA support.
  services.pipewire.alsa.support32Bit = true; # Enable 32-bit ALSA support on 64-bit systems.
  security.rtkit.enable = true; # Enable the RealtimeKit system service
}
