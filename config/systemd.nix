{ ... }:
{
  # Change systemd timeout
  systemd.settings.Manager = {
  DefaultTimeoutStopSec = "10s";
};
systemd.network.wait-online.enable = false;
systemd.oomd = {
    enable = false;
  };
}
