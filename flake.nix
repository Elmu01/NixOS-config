{
    description = "Elmu's nix config";

    outputs = {
        nixpkgs,
        ...
    } @ inputs: let
    username = "elmu";
    in {
        nixosConfigurations = {
            nixos-elmu = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/nixos-elmu.nix
                ];
            }; 
        };
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05"; #kyseinem numerosarja ON MUUTETTAVA, jotta järjestelmän versio päivittyy!
    };
    nixConfig = {
        experimental-features = ["nix-command" "flakes"]; 

        substituters = [ #asentaa valmiiksi rakennetut paketit.
            "https://cache.nixos.org"
        ];
    };
}