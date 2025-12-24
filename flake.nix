{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";      
      # Optional but recommended to limit the size of your system closure.
     inputs.nixpkgs.follows = "nixpkgs";
     };

    nixos-06cb-009a-fingerprint-sensor = {
    url = "github:iedame/nixos-06cb-009a-fingerprint-sensor?ref=25.11";
    inputs.nixpkgs.follows = "nixpkgs";
   };
   
/*    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };*/
  
    /*dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };*/
  };

  outputs = { nixpkgs,  lanzaboote, nixos-06cb-009a-fingerprint-sensor,/* dms, noctalia,*/ ... }:  {
    # system stuff
    nixosConfigurations.t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
	 nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
	 lanzaboote.nixosModules.lanzaboote
	#noctalia.nixosModules.default
	# dms.nixosModules.dank-material-shell
	# dms.nixosModules.greeter
        ./machines/t480/hardware-configuration.nix # Include the results of the hardware scan.
        ./shared/shared.nix
        ./machines/t480/t480.nix
 ];
};
}; 
}
