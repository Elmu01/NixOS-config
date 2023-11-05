{config, pkgs, ... }:
{
    imports = [../hardware-configuration.nix];

    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

    networking = {
        hostName = "nixos-elmu";
        networkmanager.enable = true;
    };

    nixpkgs.config.allowUnfree = true;

    nix.settings = {
        experimental.features = ["nix-command" "flakes"];
        auto-optimise-store = true; 
        trusted-users = ["elmu"];
    };

    time.timeZone = "Europe/Helsinki";
    console.keyMap = "fi";
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

    servises.openssh = {
        enable = true;
        settings = {
            X11Forwarding = false;
            PermitRootLogin = "no";
            PasswordAuthentication = true;
        };
    };

    environment.systemPackages = with pkgs; [
        micro
        curl
        wget
        git
    ];

    environment.variables.EDITOR = "micro";

    users.groups.elmu = {};

    users.users.elmu ={
        hashedPassword = "$6$8hkMhUxa77V32BMO$gML7IooUyAX3ICLpPwMGUl8IM.c7stUvy/HaUqNRtWBy/78lrL6lExHTp./vhlXveV7reXfqvYwNbinaX/Tcs/";
        home = "/home/elmu";
        isNormalUser = true;
        extraGroups = [
            "elmu"
            "users"
            "networkmanager"
            "wheel"
        ];
    };

    system.stateVersion = "23.05"; #tämä ei muutu ilman, että on varmistettu järjestelmän päivitysten jälkeinen toimivuus!!
}