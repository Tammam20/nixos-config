{ config, pkgs, lib, inputs, ... }:
{
imports = [
  inputs.dms.nixosModules.dankMaterialShell
];
programs.dankMaterialShell.enable = true;

}
