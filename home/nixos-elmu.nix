{ pkgs, ... }:
{
    imports = [];

    home = {
        username = "elmu";
        homeDirectory = "/home/elmu";

        packages = with pkgs; [ #käyttäjäkohtaiset paketit täältä
            neofetch
            btop
        ];

        stateVersion = "23.11";
    };

    # Anna home managerin hallita itseään
    programs.home-manager.enable = true;
}