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
            nixosModules
            ++ [
                {
                    # 'nix run nixpkgs#nixpkgs' käyttämään samoja paketti versioita kuin järjestelmä itse
                    nix.registery.nixpkgs.flake = nixpkgs;

                    # 'nix repl '<nixpkgs>' käyttämään samoja paketti versioita kuin itse järjestelmä'
                    environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
                    nix.nixPath = ["/etc/nix/inputs"];
                }

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.elmu = home-module;
                }

            ];
    }