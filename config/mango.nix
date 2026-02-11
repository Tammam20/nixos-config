{ pkgs, ... }:

{
  services.xserver.enable = true;
#  services.displayManager.lemurs.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.theme.name = "Adwaita-dark";
#  services.xserver.displayManager.lightdm.extraConfig = ''
#  Section "InputClass"
#    Identifier "keyboard"
#    MatchIsKeyboard "yes"
#    Option "XkbLayout" "de"
#    Option "XkbVariant" "nodeadkeys"
#  EndSection
 # '';
  services.gvfs.enable = true;
  security.soteria.enable = true;
  programs.dconf.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.tumbler.enable = true;
  xdg.terminal-exec.enable = true;  
  xdg.portal = {
      enable = true;

      config = {
        mango = {
          default = [
            "gtk"
          ];
          # except those
          "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
          "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
          "org.freedesktop.impl.portal.ScreenShot" = ["wlr"];

          # wlr does not have this interface
          "org.freedesktop.impl.portal.Inhibit" = [];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];

      wlr.enable =  true;

      configPackages = [pkgs.mangowc];
    };

    programs.xwayland.enable = true;

    services = {
      displayManager.sessionPackages = [pkgs.mangowc];

      graphical-desktop.enable = true;
    };

  environment.systemPackages = with pkgs; [
    foot
    wmenu
    wl-clipboard
    grim
    slurp
    swaybg
    sway-audio-idle-inhibit
    swayidle
    swayosd
    swaynotificationcenter
    wlsunset
    brightnessctl
    wlogout
    networkmanagerapplet
    playerctl

    (pkgs.symlinkJoin {
	    name = "mangowc";
	    buildInputs = [ makeWrapper ];
	    paths = [ pkgs.mangowc ];
	    postBuild = ''
	        wrapProgram $out/bin/mango --append-flags "-c ${../progconfig/mango/config.conf}" 
	        '';
      })

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
       # icon-theme = "";
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

