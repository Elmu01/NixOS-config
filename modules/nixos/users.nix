{ ... }:
{
    # Luotetut Nix käyttäjät
    nix.settings.trusted-users = ["elmu"];

    # Ryhmä käyttäjälle
    users.groups.elmu = {};

    # Käyttäjätili
    users.users.elmu ={
        # Piilotettu salasanan
        hashedPassword = "$6$8hkMhUxa77V32BMO$gML7IooUyAX3ICLpPwMGUl8IM.c7stUvy/HaUqNRtWBy/78lrL6lExHTp./vhlXveV7reXfqvYwNbinaX/Tcs/";
        # kotikansio
        home = "/home/elmu";
        # oikea käyttäjä, ei järjestelmän palvelu käyttäjätili
        isNormalUser = true;
        # lisää ryhmät networkmanageria ja sudo oikeuksia varten
        extraGroups = [
            "elmu"
            "users"
            "networkmanager"
            "wheel"
        ];
    };
}