{ pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  programs.mango.enable = true;

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
    (pkgs. symlinkJoin {
	    name = "mango";
	    buildInputs = [ pkgs.makewrapper ];
	    paths = [ pkgs.mango ];
	    postBuild = ''
	        wrapProgram $out/bin/mango
	        --append-flags "--config ${../progconfig/mango/config.conf}" 
	        '';
      })
      (pkgs. symlinkJoin {
	    name = "waybar";
	    buildInputs = [ pkgs.makewrapper ];
	    paths = [ pkgs.waybar ];
	    postBuild = ''
	        wrapProgram $out/bin/mango
	        --append-flags "--config ${../progconfig/config.conf}" 
	        '';
      })
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];



}

