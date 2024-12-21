{
  description = "Home Manager configuration";

  inputs = {
    # Specify the nixpkgs version you want to use
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11"; # or "nixos-unstable" for latest
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11"; # match with nixpkgs version
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";  # adjust for your system (x86_64-linux, aarch64-darwin, etc.)
    in {
      homeConfigurations."zkl10" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home.nix ];
      };
    };
} 