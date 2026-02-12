{ ... }:

{
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
	name = "Tammam20"; };
};
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tammam = import ./home.nix;
  services.getty.autologinUser = "tammam";
  programs.dconf.enable = true;
  # Enable Home-Manager for user tammam
  /*home-manager.users.tammam = { pkgs, ... }: {

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";

  # Use Dark Theme for GTK apps
    gtk = {
    enable = true;
    iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
    };

    theme = {
     name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };
  };

  home.pointerCursor = {
  name = "Adwaita";
  package = pkgs.gnome.adwaita-icon-theme;
  size = 24;
  x11 = {
  enable = true;
  defaultCursor = "Adwaita";
   };
  };

 };*/

  # Fix Home-Manager error
 /* programs.dconf.enable = true; */
}
