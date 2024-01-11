{ config, pkgs, lib, ... }:
 
{
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
  
}
