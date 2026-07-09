{ flake.nixosModules.flatpak = { ... }: {
 # Enable Flatpak support
  services.flatpak.enable = true;
};
}