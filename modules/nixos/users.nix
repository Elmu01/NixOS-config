{ ... }:
{
    nix.settings.trusted-users = ["elmu"];

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
}