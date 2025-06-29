# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
      
{ /*config, pkgs, lib, inputs,*/ ... }:
      
{
  imports = [
      # Universal Options:
      ./services.nix # Services
      ./packages.nix # NixPkgs
      ./users.nix # Users
      ./locales.nix # Fonts & Locales
      ./gnome.nix # gnome desktop environment
    ];
  # bootable system
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["nowatchdog" "mitigations=off"];
  boot.blacklistedKernelModules = ["intel_pmc_bxt" /*"xpad"*/  "iTCO_wdt" /*"iTCO_vendor_support"*/];
  #boot.loader.systemd-boot.enable = true;
  
  # system stuff
  services.thermald.enable = true;
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
        
        #RUNTIME_PM_ON_AC = "auto";
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
       START_CHARGE_THRESH_BAT0 = 75; # 75 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

     };
   };
  services.fwupd.enable = true;

  # Optimising the Nix store
  nix.settings.auto-optimise-store = true;

  nix = {
  gc = {
    automatic = true; 
    dates = "daily"; 
    options = "--delete-older-than 2d";
  };
};
      
  # Enable nix-command and flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

      
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
      
}
