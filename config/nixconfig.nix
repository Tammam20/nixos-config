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
  nix.package = determinate.packages.${pkgs.system}.default;
  nix.settings = {
  auto-optimise-store = true;
  eval-cores = 0;
  experimental-features = [ "parallel-eval"];
};
}
