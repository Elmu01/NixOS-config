{
    description = "Elmu's nix config";

    outputs = {
        nixpkgs,
        home-manager,
        ...
    } @ inputs: let
    username = "elmu";
    in {
        nixosConfigurations = {
            nixos-elmu = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/nixos-elmu
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.userGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.elmu = import ./home/nixos-elmu.nix;
                    }
                ];
            }; 
        };
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05"; #kyseinem numerosarja ON MUUTETTAVA, jotta järjestelmän versio päivittyy!
        home.manager.url = "github:nix-community/home-manager/release-23.05";
        home-manager-inputs.nixpkgs.follows = "nixpkgs";
    };
    nixConfig = {
        experimental-features = ["nix-command" "flakes"]; 

        substituters = [ #asentaa valmiiksi rakennetut paketit.
            "https://cache.nixos.org"
        ];
    };
}