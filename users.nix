{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tammam = {
    isNormalUser = true;
    description = "Tammam Faris";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" "docker" "pipewire" ];
    /*packages = with pkgs; [
      #thunderbird
      #home-manager
    ];*/
  };

  # Enable Home-Manager for user tammam
  /*home-manager.users.tammam = { pkgs, ... }: {

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";

  # Use Dark Theme for GTK apps
  gtk = {
    enable = true;
    iconTheme = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    };

    theme = {
     name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  };*/

  # Fix Home-Manager error
  programs.dconf.enable = true;
}
