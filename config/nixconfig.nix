{ ... }:
{
 # nix = {
 # gc = {
 #   automatic = true;
 #   dates = "daily";
 #   options = "--delete-older-than 2d";
 # };
#};
  # Enable nix-command and flakes
  nix.package = pkgs.${pkgs..default;
  nix.settings = {
  auto-optimise-store = true;
};
 determinate = {
    enable = false;
 #   garbageCollector.strategy = "disabled";
  };
}
