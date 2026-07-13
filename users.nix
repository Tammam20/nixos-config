{ 
  flake.nixosModules.users = { inputs, config, pkgs, ...}: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
      # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tammam = {
    isNormalUser = true;
    description = "Tammam Faris";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" ];
    
  };
   packages = with pkgs; [
      home-manager
    ];
  };


  programs.git = {
  enable = true;
  config = {
  user = {
	email = "whymewhyalwaysme@protonmail.com";
	name = "Tammam20"; 
  };
    };
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  services.getty.autologinUser = "tammam";
  programs.dconf.enable = true;
  # Enable Home-Manager for user tammam
  home-manager.users.tammam = ./home.nix;
  #home-manager.backupFileExtension = "backup";
}