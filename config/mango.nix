{ pkgs, ... }:

{
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    foot
    wmenu
    wl-clipboard
    grim
    slurp
    swaybg
    networkmanagerapplet
    waybar
    blueman
    sway-audio-idle-inhibit
    swayidle
    swayosd
    swaynotificationcenter
    wlsunset
    (pkgs. symlinkJoin {
	name = "mango";
	buildInputs = [ pkgs.makewrapper ];
	paths = [ pkgs.mango ];
	postBuild = ''
	wrapProgram $out/bin/kitty
	--append-flags "--config ${../progconfig/config.conf}" 
	'';
})
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];



}

