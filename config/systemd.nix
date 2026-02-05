{ ... }:
{
  # Change systemd timeout
  systemd.settings.Manager = {
  DefaultTimeoutStopSec = "10s";
};
}
