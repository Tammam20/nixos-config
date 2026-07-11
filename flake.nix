{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    flake-parts.url = "github:hercules-ci/flake-parts";

    /*home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };*/
    nixos-06cb-009a-fingerprint-sensor = {
    url = "github:iedame/nixos-06cb-009a-fingerprint-sensor?ref=25.11";
    inputs.nixpkgs.follows = "nixpkgs";
   };
 /*  autoaspm = {
    url = "git+https://git.notthebe.ee/notthebee/AutoASPM";
     inputs.nixpkgs.follows = "nixpkgs";
  };*/   
    /*impermanence = {
	    url = "github:nix-community/impermanence";
    	inputs.nixpkgs.follows = "nixpkgs";
  };*/

  };

 # Import all .nix files from current directory except flake.nix recursively
  outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    inherit (lib.fileset) toList fileFilter;

    isNixModule = file:
      file.hasExt "nix"
      && file.name != "flake.nix"
      && !lib.hasPrefix "_" file.name;

    importTree = path:
      toList (fileFilter isNixModule path);

    mkFlake = inputs.flake-parts.lib.mkFlake {inherit inputs;};
  in
    mkFlake {imports = importTree ./.;};
}
