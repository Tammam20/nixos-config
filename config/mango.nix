{ pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  security.soteria.enable = true;
  programs.dconf.enable = true;
  programs.mango.enable = true;
  programs.mango.package = (pkgs.mango.symlinkJoin {
	    name = "mango";
	    buildInputs = [ pkgs.mango.makeWrapper ];
	    paths = [ pkgs.mango.mango ];
	    postBuild = ''
	        wrapProgram $out/bin/mango
	          --append-flags "-c ${../progconfig/mango/config.conf}" 
	        '';
      });

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
	    name = "waybar";
	    buildInputs = [ pkgs.makewrapper ];
	    paths = [ pkgs.waybar ];
	    postBuild = ''
	        wrapProgram $out/bin/waybar
	        --append-flags "-c ${../progconfig/waybar/config.jsonc} -s ${../progconfig/waybar/style.css}" 
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

