{
  description = "Nixos + Home Manager + Stylix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/vm/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/desktop/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/laptop/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
    homeConfigurations."underman" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [ ./home.nix ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}

