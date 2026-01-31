{ pkgs, lib, ... }:
      
{     
imports = [
./hardware-configuration.nix
];

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
      # bootable system
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["nowatchdog" "mitigations=off" /*"i915.enable_psr=0" "i915.enable_fbc=0"*/];
  boot.blacklistedKernelModules = [ "iTCO_wdt" "intel_oc_wdt" ];
  #boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # system stuff
  services.thermald.enable = true;
  services.fwupd.enable = true;
  services.hardware.bolt.enable = true;

  services."06cb-009a-fingerprint-sensor" = {                                 
  enable = true;                                                            
  backend = "python-validity";                                              
};   
  
        /*services."06cb-009a-fingerprint-sensor" = {
  	    enable = true;                                                            
  	    backend = "libfprint-tod";
	    calib-data-file = ./calib-data.bin;
	};*/

  services.power-profiles-daemon.enable = false;
#  services.autoaspm.enable = true;
  services.undervolt = {
    enable = true;
    #useTimer = true;
    coreOffset = -75;
    gpuOffset = -75;
    uncoreOffset = -75;
    #p1.limit = 29;
    #p1.window = 2;
    #p2.limit = 45;
    #p2.window = 0.001;
  };
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        
        MEM_SLEEP_ON_AC = "deep";
        MEM_SLEEP_ON_BAT = "deep";
        
        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        
        #PCIE_ASPM_ON_AC = "powersave";
        #PCIE_ASPM_ON_BAT = "powersave";
        
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;

        INTEL_GPU_MIN_FREQ_ON_AC = 350;
        INTEL_GPU_MIN_FREQ_ON_BAT = 350;
        INTEL_GPU_MAX_FREQ_ON_AC = 050;
        INTEL_GPU_MAX_FREQ_ON_BAT = 450;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 550;
        
        SOUND_POWER_SAVE_ON_AC = 1;
        SOUND_POWER_SAVE_ON_BAT = 1;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 75; # 75 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

     };
   };
    	networking.hostName = "t480";
    security.pam.services.sudo.text = ''
    # Account management.
    account required pam_unix.so
    
    # Authentication management.
    auth sufficient pam_unix.so   likeauth try_first_pass nullok
    auth sufficient pam_fprintd.so
    auth required pam_deny.so
    
    # Password management.
    password sufficient pam_unix.so nullok sha512
    
    # Session management.
    session required pam_env.so conffile=/etc/pam/environment readenv=0
    session required pam_unix.so
  '';


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
   }
    
