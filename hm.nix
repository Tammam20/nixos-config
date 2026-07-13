 {
  inputs,
  self,
  ...
}:
{ flake = {
        # Reusable Home Manager module.
        homeModules.hm= { pkgs, ... }: {
          
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
  
        # Enable Home-Manager for user tammam
        #home-manager.backupFileExtension = "backup";
         
        };

        # Concrete Home Manager configuration.
        homeConfigurations.tammam = inputs.home-manager.lib.homeManagerConfiguration {
          modules = [
            inputs.self.homeModules.bash
            {
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
              manual.manpages.enable = false;
            }
          ];
        };
      };
 }    







