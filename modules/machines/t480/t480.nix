{ config, pkgs, lib, inputs, ... }:
      
{     

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;
            # bootable system
  	    boot.loader.efi.canTouchEfiVariables = true;
  	    boot.kernelParams = ["nowatchdog"];
  	    #boot.loader.systemd-boot.enable = true;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
              };

	    services."06cb-009a-fingerprint-sensor" = {
  	    enable = true;                                                            
  	    backend = "python-validity";                                              
	};
	security.pam.services.sudo.text = "# In /etc/pam.d/common-auth, the following line is added, and the next line changed.
# The end result (apart from other things that may be in the file) is this:
auth  [success=2 default=ignore]  pam_fprintd.so max_tries=1 timeout=10 # debug
auth  [success=1 default=ignore]  pam_unix.so nullok_secure try_first_pass";
    	networking.hostName = "t480";
    	
   }
    
