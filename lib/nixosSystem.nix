{
    nixpkgs,
    home-manager,
    system,
    specialArgs,
    nixos-modules,
    home-module,
}:
    nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = 
            # Järjestelmäkohtaiset moduulit
            nixos-modules
            ++ [
                # nix komentoihin liittyvää
                {
                    # 'nix run nixpkgs#nixpkgs' käyttämään samoja paketti versioita kuin järjestelmä itse
                    nix.registry.nixpkgs.flake = nixpkgs;

                    # 'nix repl '<nixpkgs>' käyttämään samoja paketti versioita kuin itse järjestelmä'
                    environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
                    nix.nixPath = ["/etc/nix/inputs"];
                }
                # home-managerin käyttöönotto
                home-manager.nixosModules.home-manager
                {
                    # Käytä itse valittua NixOS:n pakettiversioita Home Managerin hallinnoiman version sijasta
                    # Tämä lisää johdonmukaisuutta ja nopeuttaa järjestelmän päivittämistä
                    home-manager.useGlobalPkgs = true; 
                    # Asenna paketit järjestelmätasolla
                    home-manager.useUserPackages = true;
                    # käyttäjätilin hallintaan 
                    home-manager.users.elmu = home-module;
                }

            ];
    }