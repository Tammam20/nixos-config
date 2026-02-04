{ pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  security.soteria.enable = true;
  programs.dconf.enable = true;
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

    security.polkit.enable =  true;

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
    networkmanagerapplet
    blueman
    sway-audio-idle-inhibit
    swayidle
    swayosd
    swaynotificationcenter
    wlsunset
    papirus-icon-theme
    brightnessctl
    wlogout

    (pkgs.symlinkJoin {
	    name = "mangowc";
	    buildInputs = [ makeWrapper ];
	    paths = [ pkgs.mangowc ];
	    postBuild = ''
	        wrapProgram $out/bin/mangowc
	          --append-flags "-c ${../progconfig/mango/config.conf}" 
	        '';
      })

      (pkgs.symlinkJoin {
	    name = "waybar";
	    buildInputs = [ makeWrapper ];
	    paths = [ pkgs.waybar ];
	    postBuild = ''
	        wrapProgram $out/bin/waybar
	        --append-flags "-c ${../progconfig/mango/waybar/config.jsonc} -s ${../progconfig/mango/waybar/style.css}" 
	        '';
      })
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

    /*programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita";
        icon-theme = "";
        font-name = "Noto Sans Medium 11";
        document-font-name = "Noto Sans Medium 11";
        monospace-font-name = "Noto Sans Mono Medium 11";
      };
    }
  ];*/


}

