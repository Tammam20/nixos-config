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

  outputs = { self, nixpkgs, lanzaboote, nixos-06cb-009a-fingerprint-sensor, ... }: {
    # system stuff
    nixosConfigurations.t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        
        lanzaboote.nixosModules.lanzaboote
	nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"

          ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
              };

	    services."06cb-009a-fingerprint-sensor" = {                                 
            enable = true;                                                            
  	    backend = "libfprint-tod";                                                
 	    calib-data-file = ./calib-data.bin;                
	};
          })   
      ];
    };
  };
}
