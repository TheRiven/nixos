
{
    pkgs,
    lib,
    config,
    ...
}:

{
    options = {
        env.plasma6.enable = lib.mkEnableOption "enables plasma 6";
    };

    config = lib.mkIf config.env.plasma6.enable {
        
        # Core Services
        services.desktopManager.plasma6.enable = true;
        services.displayManager.sddm.enable = true; # greeter with UWSM support
        #services.displayManager.sddm.wayland.enable = true; # Set SDDM to wayland?

        # Extra Services
        #services.geoclue2.enable = true; # Location service

        # Enable vivaldi plasma connect with chromium
        #programs.chromium.enable = vivaldiConfig.plasma;
        programs.chromium.enablePlasmaBrowserIntegration = vivaldiConfig.plasma;


        environment.systemPackages = with pkgs; [
            cmus # console music player
            vivaldi # browser
            libreoffice-qt6-fresh # Libre Office
            hunspell # Spelling support
            hunspellDicts.en_GB-large # UK Dictionary
        ];

        fonts = {
            packages = with pkgs; [
                font-awesome
                noto-fonts
                noto-fonts-cjk-sans
                noto-fonts-emoji
                dejavu_fonts
                nerd-fonts.iosevka-term
                nerd-fonts.noto
            ];
        };

        # Stylix Theming for environment
        stylix.enable = true;
        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
        stylix.polarity = "dark"; 
        
    };

}
