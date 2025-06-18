{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      
      # Optional but recommended to limit the size of your system closure.
     inputs.nixpkgs.follows = "nixpkgs";
     };
    nixos-06cb-009a-fingerprint-sensor = {
    url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=25.05";
    inputs.nixpkgs.follows = "nixpkgs";
   };
  };

  outputs = { self, nixpkgs, lanzaboote, nixos-06cb-009a-fingerprint-sensor, ... } @ inputs: {
    # system stuff
    nixosConfigurations.t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
	nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
	lanzaboote.nixosModules.lanzaboote
        ./modules/machines/t480/hardware-configuration.nix # Include the results of the hardware scan.
        ./modules/shared.nix
        ./modules/machines/t480/t480.nix
 ];
};
}; 
}
