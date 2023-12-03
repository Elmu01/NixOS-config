{config, pkgs, ... }:
{
    imports = [
        # yhdistää muihin paikkoihin kirjoitetut tiedostot default.nixiin
        ./hardware-configuration.nix # laitteiston kokoopanon tiedot
        ../../modules/nixos/core.nix # yleiset asetukset
        ../../modules/nixos/users.nix # käyttäjätilit
        ../../modules/nixos/desktop.nix # työpöydän asetukset
        ];

    # UEFI-boot
   # boot.loader = {
        # Saa muokata EFI muuttujia (käynnistysvaihtoehtojen lisäksi UEFI:in)
   #     efi.canTouchEfiVariables = true;
   #     # valittu käynnistyslataaja
   #     systemd-boot.enable = true;
   # };

    # Bios-boot
    boot.loader.grub = {
        enable = true;
        device = "/dev/vda1";
    };

    networking = {
        hostName = "nixos-elmu"; #järjestelmän nimi
        networkmanager.enable = true; # networkmanager netin käyttämiseksi
    };

    system.stateVersion = "23.05"; #tämä ei muutu ilman, että on varmistettu järjestelmän päivitysten jälkeinen toimivuus!!
}