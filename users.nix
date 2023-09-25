{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tammam = {
    isNormalUser = true;
    description = "Tammam Faris";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" ];
    packages = with pkgs; [
      firefox
      thunderbird
    ];
  };
}
