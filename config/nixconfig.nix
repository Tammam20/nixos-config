{ ... }:
{
  # Optimising the Nix store
  nix.settings.auto-optimise-store = true;

 # nix = {
 # gc = {
 #   automatic = true;
 #   dates = "daily";
 #   options = "--delete-older-than 2d";
 # };
#};
  nix.extraOptions = ''
  eval-cores = 0
'';
  # Enable nix-command and flakes
  nix.settings.experimental-features = ["nix-command" "flakes" "parallel-eval"];
}
