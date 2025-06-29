{ /*config,*/ pkgs, lib, /*inputs,*/ ... }:
      
{     

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            #boot.kernelParams = ["intel_iommu=on" "iommu=pt"];
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
    	networking.hostName = "t480";
    	
   }
    
