{ flake.nixosModules.sway = { inputs, config, pkgs, ...}: {
  services.xserver.displayManager.lightdm.enable = false;
  services.gvfs.enable = true;
  programs.sway.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  programs.nm-applet.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;

  environment.systemPackages = with pkgs; [
    foot
    wmenu
    wl-clipboard
    grim
    slurp
    swaybg
    sway-audio-idle-inhibit
    swayidle
    swaynotificationcenter
    brightnessctl
    playerctl
    papirus-icon-theme
    gnome-themes-extra
    lxqt.lxqt-policykit
    wl-clip-persist
    waybar
  ];
    programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita-dark";
	      color-scheme = "prefer-dark";
        icon-theme = "Papirus-Dark";
      };
    }
  ];
 qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.thunar.enable = true;
  programs.thunar.plugins = [
  pkgs.thunar-archive-plugin  
  pkgs.thunar-media-tags-plugin
  pkgs.thunar-vcs-plugin
  pkgs.thunar-volman
];
}; 
}
