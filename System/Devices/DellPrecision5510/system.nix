{ config, pkgs, ... }:
  
{ 
  # Boot
  # Kernel Parameters
  boot.kernelParams = [ "mitigations=off" ]; 
  
  # Kernel package
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;

  # To enable systemd-boot without secure-boot support
  boot.loader.systemd-boot.enable = true;

  # To enable systemd with secure-boot support
  #boot.loader.systemd-boot.enable = lib.mkForce false;
  
  # Enable NTFS support
  boot.supportedFilesystems = [ "ntfs" /*"bcachefs"*/ ];
  
  # Show plymoth splash screen when booting:
  #boot.plymouth.enable = true;
  
  # kernel console loglevel
  boot.consoleLogLevel = 1;

  # List services that you want to change:
  
  networking.hostName = "DellPrecision5510"; # Define your hostname.
  
  # Power management:
 /*services.auto-cpufreq = {
  enable = true; # Enable auto-cpufreq service
  settings = {
  charger = {
     governor = "performance";
     energy_performance_preference = "performance";
     turbo = "always";     
  };
  battery = {
     governor = "powersave";
     energy_performance_preference = "power";
     scaling_min_freq = "800000";
     scaling_max_freq = "1000000";
     turbo = "never";
   };
  };
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
        
        PCIE_ASPM_ON_AC = "powersave";
        PCIE_ASPM_ON_BAT = "powersave";
        
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;

        INTEL_GPU_MIN_FREQ_ON_AC = "350";
        INTEL_GPU_MIN_FREQ_ON_BAT = "350";
        INTEL_GPU_MAX_FREQ_ON_AC = "650";
        INTEL_GPU_MAX_FREQ_ON_BAT = "450";
        INTEL_GPU_BOOST_FREQ_ON_AC = "1050";
        INTEL_GPU_BOOST_FREQ_ON_BAT = "550";
        
        SOUND_POWER_SAVE_ON_AC = 1;
        SOUND_POWER_SAVE_ON_BAT = 1;

       #Optional helps save long term battery health
       #START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

     };
   };
  #powerManagement.powertop.enable = true;
  services.thermald.enable = true; # Enable thermald for improved efficiency 
  services.power-profiles-daemon.enable = false; # Disable Power Profiles  
  
  # Undervolting
  services.undervolt = {
    enable = true;
    useTimer = true;
    coreOffset = -159;
    uncoreOffset = -159;
    #gpuOffset = -16;
    p1.limit = 40;
    p1.window = 2;
    p2.limit = 45;
    p2.window = 0.001;
  };
  
  # Virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.podman.enable = true;
  #virtualisation.vmware.host.enable = true;

  # Firmware
  services.fwupd.enable = true;

  # Enable Trusted Platform Module 2 support.
  security.tpm2.enable = true;
  security.tpm2.abrmd.enable = true;
 
  # Set tty loglevel
  services.ttyd.logLevel = 1; 

  # NVIDIA GPU DRIVER
  
  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
 
  # Tell Xorg to use the nvidia driver (also valid for Wayland)
   services.xserver.videoDrivers = ["nvidia"];
   boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
    
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    #powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    #powerManagement.finegrained = true;
  
    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = false;
  
    # Enable the nvidia settings menu
    nvidiaSettings = true;
  
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  # Nvidia PRIME  
  hardware.nvidia.prime = {
      offload = {
 	  enable = true;
	  enableOffloadCmd = true;
 	};
  
    # Make sure to use the correct Bus ID values for your system!
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0";
  };
  
 # Accelerated Video Playback
 
  hardware.opengl = {
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  
 }
