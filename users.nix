{ 
  flake.nixosModules.users = { inputs, config, pkgs, ...}: {
#    imports = [ inputs.home-manager.flakeModules.home-manager ];
      # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tammam = {
    isNormalUser = true;
    description = "Tammam Faris";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" ];
    
  };
   services.getty.autologinUser = "tammam";
  programs.dconf.enable = true;
    programs.git = {
  enable = true;
  config = {
  user = {
	email = "whymewhyalwaysme@protonmail.com";
	name = "Tammam20"; 
  };
    };
  };
  
  };
 
}
