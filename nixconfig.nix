{ flake.nixosModules.nixconfig = { ... }: {
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
#  nix.package = inputs'.determinate.packages.${pkgs.system}.default;
  nix.settings = {
#  eval-cores = 0;
#  lazy-trees = true;
  experimental-features = [ /*"lazy-trees" "parallel-eval"*/ "nix-command" "flakes"  ];
  auto-optimise-store = true;
  };
# determinate = {
 #   enable = false;
 #   garbageCollector.strategy = "disabled";
#  };
};
}

