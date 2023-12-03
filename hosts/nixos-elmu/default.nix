{config, pkgs, ... }:
{
    imports = [
        # yhdistää muihin paikkoihin kirjoitetut tiedostot default.nixiin
        ./hardware-configuration.nix # laitteiston kokoopanon tiedot
        ../../modules/nixos/core.nix # yleiset asetukset
        ../../modules/nixos/users.nix # käyttäjätilit
        ../../modules/nixos/desktop.nix # työpöydän asetukset
        ];

    # EFI käynnistyslataajan asetukset
    boot.loader = {
        # Saa muokata EFI muuttujia (käynnistysvaihtoehtojen lisäksi UEFI:in)
        efi.canTouchEfiVariables = true;
        # valittu käynnistyslataaja
        systemd-boot.enable = true;
    };

    networking = {
        hostName = "nixos-elmu"; #järjestelmän nimi
        networkmanager.enable = true; # networkmanager netin käyttämiseksi
    };

    system.stateVersion = "23.05"; #tämä ei muutu ilman, että on varmistettu järjestelmän päivitysten jälkeinen toimivuus!!
}