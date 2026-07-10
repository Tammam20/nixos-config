{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.t480 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.t480
    ];
  };

  flake.nixosModules.t480 = {
    pkgs,
    config,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.t480hard
      self.nixosModules.users
      self.nixosModules.virt
      self.nixosModules.sway
      self.nixosModules.nixconfig
      self.nixosModules.systemd
      self.nixosModules.pipewire
      self.nixosModules.flatpak
      self.nixosModules.locales
      self.nixosModules.cups
      self.nixosModules.packages
      inputs.nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
      inputs.lanzaboote.nixosModules.lanzaboote
    ];

    # For debugging and troubleshooting Secure Boot.
     environment.systemPackages = [
       pkgs.sbctl 
     ];
     # Lanzaboote currently replaces the systemd-boot module.
     # This setting is usually set to true in configuration.nix
     # generated at installation time. So we force it to false
     # for now.
     #boot.kernelParams = ["intel_iommu=on" "iommu=pt"];
    boot.loader.limine.enable = true;
     
      # bootable system

  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["nowatchdog" "mitigations=off" /*"i915.enable_psr=0" "i915.enable_fbc=0"*/];
  boot.blacklistedKernelModules = [ "iTCO_wdt" "intel_oc_wdt" ];
  #boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "ntsync" ];
#  system.nixos-init.enable = true;
 # system.nixos-init.package = pkgs.booster;
  #zramSwap.enable = true;
  /*boot.kernel.sysctl = {
"vm.swappiness" = 100;
"vm.vfs_cache_pressure" = 50;
"vm.dirty_bytes" = 268435456;
"vm.page-cluster" = 0;
"vm.dirty_background_bytes" = 67108864;
"vm.dirty_writeback_centisecs" = 1500;
"kernel.nmi_watchdog" = 0;
"kernel.unprivileged_userns_clone" = 1;
"kernel.kptr_restrict" = 2;
"net.core.netdev_max_backlog" = 4096;
"fs.file-max" = 2097152;
};*/ 
  # system stuff  
  services.fstrim.enable = true;
  services.thermald.enable = true;
  services.fwupd.enable = true;
  services.hardware.bolt.enable = true;
  services."06cb-009a-fingerprint-sensor" = {                                 
  enable = true;                                                            
  backend = "python-validity";                                              
};
powerManagement.resumeCommands = "systemctl restart python3-validity.service";
security.pam.services = {
sudo.fprintAuth = true;
login.fprintAuth = true;
polkit-1.fprintAuth = true;
};
      /*services."06cb-009a-fingerprint-sensor" = {
  	    enable = true;                                                            
  	    backend = "libfprint-tod";
	    calib-data-file = ./calib-data.bin;
	};*/

  services.power-profiles-daemon.enable = false;
 # services.autoaspm.enable = true;
 # networking.networkmanager.wifi.powersave = false;
/*  services.undervolt = {
    enable = true;
    #useTimer = true;
    coreOffset = -75;
    gpuOffset = -75;
    uncoreOffset = -75;
    analogioOffset = -75;
    #p1.limit = 29;
    #p1.window = 2;
    #p2.limit = 45;
    #p2.window = 0.001;
  };*/
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
	      #WIFI_PWR_ON_AC = "off";
	      #WIFI_PWR_ON_BAT = "off";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;

        INTEL_GPU_MIN_FREQ_ON_AC = 350;
        INTEL_GPU_MIN_FREQ_ON_BAT = 350;
        INTEL_GPU_MAX_FREQ_ON_AC = 1050;
        INTEL_GPU_MAX_FREQ_ON_BAT = 450;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 550;
        SOUND_POWER_SAVE_ON_AC = 1;
        SOUND_POWER_SAVE_ON_BAT = 1;
        START_CHARGE_THRESH_BAT1 = 75; 
        STOP_CHARGE_THRESH_BAT1 = 80;
        #START_CHARGE_THRESH_BAT0 = 75; 
        #STOP_CHARGE_THRESH_BAT0 = 80; 

     };
   };
      #services.scx.enable = true;
      #services.scx.scheduler = "scx_lavd";
#     services.scx.extraArgs = [
 #       "--autopower"
 #     ];
    	networking.hostName = "t480";   
    # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
  };
}