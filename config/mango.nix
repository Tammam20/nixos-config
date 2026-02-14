{ pkgs,... }:
{
    #services.xserver.enable = true;
  #services.displayManager.sddm.wayland.compositor = "";
  services.xserver.displayManager.lightdm.enable = false;
  services.gvfs.enable = true;
  programs.uwsm.enable = true;
  programs.mango.enable = true;
  programs.uwsm.waylandCompositors = {
  mango = {
  prettyName = "mango";
  comment = "mango compositor managed by UWSM";
  binPath = "/run/current-system/sw/bin/mango";
};
};
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
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
    wlsunset
    brightnessctl
    wlogout
    networkmanagerapplet
    playerctl
    papirus-icon-theme
    gnome-themes-extra
    lxqt.lxqt-policykit
    wlr-which-key
      (pkgs.symlinkJoin {
	    name = "waybar";
	    buildInputs = [ makeWrapper ];
	    paths = [ pkgs.waybar ];
	    postBuild = ''
	        wrapProgram $out/bin/waybar --append-flags "-c ${../progconfig/mango/waybar/config.jsonc} -s ${../progconfig/mango/waybar/style.css}" 
	        '';
      })
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
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

}
