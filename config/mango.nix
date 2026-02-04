{ pkgs, ... }:

{
  /*imports = [
    inputs.mango.nixosModules.mango
  ];*/

  services.displayManager.ly.enable = true;
  security.soteria.enable = true;
  programs.dconf.enable = true;
  programs.mango.enable = true;
  #programs.mango.package = ;

  environment.systemPackages = [
    pkgs.foot
    pkgs.wmenu
    pkgs.wl-clipboard
    pkgs.grim
    pkgs.slurp
    pkgs.swaybg
    pkgs.networkmanagerapplet
    pkgs.blueman
    pkgs.sway-audio-idle-inhibit
    pkgs.swayidle
    pkgs.swayosd
    pkgs.swaynotificationcenter
    pkgs.wlsunset
    pkgs.papirus-icon-theme
    pkgs.brightnessctl
    pkgs.wlogout
    (pkgs.symlinkJoin {
      name = "mango";
      buildInputs = [ pkgs.makeWrapper ];
      paths = [ pkgs.mango ];
      postBuild = ''
        wrapProgram $out/bin/mango --append-flags "-c ${../progconfig/mango/config.conf}"
      '';
    })

    (pkgs.symlinkJoin {
      name = "waybar";
      buildInputs = [ pkgs.makeWrapper ];
      paths = [ pkgs.waybar ];
      postBuild = ''
        wrapProgram $out/bin/waybar --append-flags "-c ${../progconfig/waybar/config.jsonc} -s ${../progconfig/waybar/style.css}"
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

