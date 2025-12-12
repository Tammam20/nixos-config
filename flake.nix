{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";      
      # Optional but recommended to limit the size of your system closure.
     inputs.nixpkgs.follows = "nixpkgs";
     };

    nixos-06cb-009a-fingerprint-sensor = {
    url = "github:iedame/nixos-06cb-009a-fingerprint-sensor?ref=25.11";
    inputs.nixpkgs.follows = "nixpkgs";
   };
  };

  outputs = { nixpkgs, lanzaboote, nixos-06cb-009a-fingerprint-sensor, ... }@inputs:  {
    # system stuff
    nixosConfigurations = { 
    t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
	      nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
	      lanzaboote.nixosModules.lanzaboote
        ./machines/t480/hardware-configuration.nix # Include the results of the hardware scan.
        ./shared/shared.nix
        ./machines/t480/t480.nix
 ];
 };
};
}; 
}
