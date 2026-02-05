{ ... }:
{
  # Change systemd timeout
  systemd.settings.Manager = {
  DefaultTimeoutStopSec = "10s";
};
boot.initrd.availableKernelModules = [ "input_leds" ];
}
