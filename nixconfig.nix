{ perSystem = { inputs', pkgs, ... }: {
 # nix = {
 # gc = {
 #   automatic = true;
 #   dates = "daily";
 #   options = "--delete-older-than 2d";
 # };
#};
  # Enable nix-command and flakes
/*  imports = [
    inputs.determinate.nixosModules
  ];*/
  nix.package = inputs'.determinate.packages.default;
  nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];
  auto-optimise-store = true;
};
# determinate = {
 #   enable = false;
 #   garbageCollector.strategy = "disabled";
#  };
};
}
