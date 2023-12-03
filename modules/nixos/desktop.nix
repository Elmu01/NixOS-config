{ config, lib, pkgs, ... }:
{
    environment.shells = with pkgs; [
        bash
    ];

    users.defaultUserShell = pkgs.bash;
    environment.systemPackages = with pkgs; [
    psmisc
];

security.rtkit.enable = true;

#Äänet
services = {
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true; 
        wireplumber.enable = true;  
    };

    flatpak.enable = true;  
};

# xdg.portal = { 
#    enable = true;

# };

#Fontit ja oletusfontit
fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji

        (nerdfonts.override {
            fonts = ["FiraCode"];
        })
        
    ];

    fontconfig.defaultFonts = {
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        monospace = ["FiraCode Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
    };
};

    #työpöytäympäristö
services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
};
}