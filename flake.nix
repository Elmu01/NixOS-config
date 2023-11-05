{
    description = "Elmu's nix config";

    outputs = {
        nixpkgs,
        home-manager,
        ...
    } @ inputs: let
        nixosSystem = import ./lib/nixosSystem.nix;

        nixos-elmu-modules = {

            nixos-modules = [
                ./hosts/nixos-elmu
            ];
            home-module = import ./home/nixos-elmu.nix;
        };
    in {
        nixosConfigurations = let
            base-args = {
                inherit home-manager;
                nixpkgs = nixpkgs;
                system = "x86_64-linux";
                specialArgs = inputs;
            };
        in {
            nixos-elmu = nixosSystem (nixos-elmu-modules // base-args);
        };
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05"; #kyseinem numerosarja ON MUUTETTAVA, jotta järjestelmän versio päivittyy!
        home-manager.url = "github:nix-community/home-manager/release-23.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
    nixConfig = {
        experimental-features = ["nix-command" "flakes"]; 

        substituters = [ #asentaa valmiiksi rakennetut paketit.
            "https://cache.nixos.org"
        ];
    };
}