{ 
  flake.nixosModules.users = {config, pkgs, ...}: {
      # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tammam = {
    isNormalUser = true;
    description = "Tammam Faris";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" ];
    
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

};
}