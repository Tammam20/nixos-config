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
  services.getty.autologinUser = "tammam";
  programs.dconf.enable = true;
  # Enable Home-Manager for user tammam
  home-manager.users.tammam = { pkgs, ... }: {

   # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tammam";
  home.homeDirectory = "/home/tammam";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  services.swayosd.enable = true;

 };
}
