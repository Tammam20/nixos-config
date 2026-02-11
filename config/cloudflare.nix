 { pkgs, ... }:

{
 # cloudflare
  environment.systemPackages = [ pkgs.cloudflare-warp ]; # for warp-svc
  systemd.packages = [ pkgs.cloudflare-warp ]; # for warp-cli
  systemd.targets.multi-user.wants = [ "warp-svc.service" "warp-taskbar" ]; # causes warp-svc to be started automatically
}
