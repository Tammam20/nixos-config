{ ... }:
{
  # Change systemd timeout
  systemd.settings.Manager = {
  DefaultTimeoutStopSec = "10s";
  DefaultRestartSec = "1s";
  DefaultStartLimitIntervalSec = "0";
};
systemd.network.wait-online.enable = false;
systemd.oomd = {
    enable = false;
  };
}
