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
  nix.settings = {
  auto-optimise-store = true;
#  eval-cores = 0;
 # experimental-features = ["nix-command" "flakes" "parallel-eval"];
};
}
