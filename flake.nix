{
    description = "Elmu's nix config";

    #ulostulot flakelle, tässä tapauksessa nixos 
    outputs = {
        # lähteet
        nixpkgs,
        home-manager,
        ...
    } @ inputs: let
        nixosSystem = import ./lib/nixosSystem.nix;

        # järjestelmän moduulit
        nixos-elmu-modules = {

            nixos-modules = [
                ./hosts/nixos-elmu
            ];
            home-module = import ./home/nixos-elmu.nix;
        };
    in {
        # nixos konfiguraatiot
        # näitä pystyy asentamaan 'nixos-install --flake .#<järjestelmä> komennolla'
        # ja päivittämään 'nixos-rebuild switch --flake .' komennolla
        nixosConfigurations = let
        # yleiset argumentit
            base-args = {
                inherit home-manager;
                nixpkgs = nixpkgs;
                system = "x86_64-linux";
                specialArgs = inputs;
            };
        in {
            #järjestelmät
            nixos-elmu = nixosSystem (nixos-elmu-modules // base-args);
        };
    };

    # lähteet joista paketteja asennetaan
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05"; #kyseinem numerosarja ON MUUTETTAVA, jotta järjestelmän versio päivittyy!
        # home-managerin jakelu    
        home-manager.url = "github:nix-community/home-manager/release-23.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    # flake tiedoston nix configuraatio
    nixConfig = {
        experimental-features = ["nix-command" "flakes"]; #sallitaan kehitteillä olevien ominaisuuksien käyttö

        substituters = [ # binääri pakettien 'välimuisti'
            "https://cache.nixos.org"
        ];
    };
}