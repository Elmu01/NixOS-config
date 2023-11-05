{config, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix 
        ../../modules/nixos/core.nix    #yhdistää muihin paikkoihin kirjoitetut tiedostot default.nixiin
        ../../modules/nixos/users.nix
        ];

    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

    networking = {
        hostName = "nixos-elmu";
        networkmanager.enable = true;
    };

    system.stateVersion = "23.05"; #tämä ei muutu ilman, että on varmistettu järjestelmän päivitysten jälkeinen toimivuus!!
}