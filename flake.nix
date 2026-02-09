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
    url = "github:tammam20/validity-nix";
    inputs.nixpkgs.follows = "nixpkgs";
   };
   mango = {
     url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    impermanence = {
	    url = "github:nix-community/impermanence";
    	inputs.nixpkgs.follows = "nixpkgs";
  };

  };

  outputs = { nixpkgs,  lanzaboote, nixos-06cb-009a-fingerprint-sensor, mango, impermanence, ... }:  {
    # system stuff
    nixosConfigurations.t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	      nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
	      lanzaboote.nixosModules.lanzaboote 
	      mango.nixosModules.mango
        impermanence.nixosModules.impermanence
        ./config/impermanence.nix
        ./config/cloudflare.nix
        ./config/cups.nix
        ./config/flatpak.nix
       #./config/gnome.nix
	      ./config/mango.nix
        ./config/locales.nix
        ./config/packages.nix
        ./config/systemd.nix
        ./config/netmgr.nix
        ./config/pipewire.nix
        ./config/users.nix
        ./config/nixconfig.nix
        ./config/virtualisation.nix
        ./devices/t480/t480.nix
 ];
};
}; 
}
