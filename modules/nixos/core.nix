{lib, pkgs, ...}:
{
    # Sallii kaupallisia lisenssejä sisältävien pakettien asennuksen
    nixpkgs.config.allowUnfree = true;

    nix.settings = {
        # Sallitaan kehitteillä olevien ominaisuuksien käyttö järjestelmätasolla
        experimental-features = ["nix-command" "flakes"];
        # Optimoi Nix:in pakettien tilankäytön
        auto-optimise-store = true; 
    };

    time.timeZone = "Europe/Helsinki"; # Aikavyöhyke
    console.keyMap = "fi"; # Näppäimistöasettelu
    #järjestelmän kieliasetukset
    i18n.defaultLocale = "en_US.UTF-8"; 
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "fi_FI.UTF-8";
        LC_MONETARY = "fi_FI.UTF-8";
        LC_MEASUREMENT = "fi_FI.UTF-8";
        LC_NUMERIC = "fi_FI.UTF-8";
        LC_PAPER = "fi_FI.UTF-8";
        LC_TELEPHONE = "fi_FI.UTF-8";
        LC_TIME = "fi_FI.UTF-8";
    };   
    # SSH palvelun asetukset
    services.openssh = {
        enable = true;
        settings = {
            X11Forwarding = false;
            PermitRootLogin = "no";
            PasswordAuthentication = true;
        };
    };
    # Järjestelmätason paketit (kaikkia ei asenneta tästä (katso nixos-elmu.nix))
    environment.systemPackages = with pkgs; [
        micro
        curl
        wget
        git
    ];
    # Järjestelmän oletus tekstieditori
    environment.variables.EDITOR = "micro";
}