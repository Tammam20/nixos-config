{ pkgs, inputs, ... }:
{
 # nix = {
 # gc = {
 #   automatic = true;
 #   dates = "daily";
 #   options = "--delete-older-than 2d";
 # };
#};
  # Enable nix-command and flakes
#  nix.package = inputs.determinate.packages.${pkgs.system}.default;
  nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];
  auto-optimise-store = true;
};
# determinate = {
 #   enable = false;
 #   garbageCollector.strategy = "disabled";
#  };
}
