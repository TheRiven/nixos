
{
    pkgs,
    lib,
    config,
    ...
}:

{
    options = {
        env.sway.enable = lib.mkEnableOption "enables Sway WM";
    };

    config = lib.mkIf config.env.sway.enable {

        programs.sway = {
            enable = true;
            wrapperFeatures.gtk = true;
            extraOptions = [
                "--unsupported-gpu"
            ];
        };

        programs.thunar.enable = true; # File Manager
        programs.seahorse.enable = true; # Gnome Keyring GUI
        programs.waybar.enable = true; # Waybar!
        programs.nm-applet.enable = true; # Connects networkmanager to gnome keyring
        programs.yazi.enable = true; # YAZI File Manager
                
        # Wrap Sway to hopefully make apps play nice together
        programs.uwsm = {
            enable = true;
            waylandCompositors = {
                sway = {
                    prettyName = "Sway";
                    comment = "UWSM managed Sway";
                    binPath = "/run/current-system/sw/bin/sway";
                };
            };

        };

        
        # Core Services
        services.gnome.gnome-keyring.enable = true; # Password Keyring
        services.displayManager.sddm.enable = true; # greeter with UWSM support
        services.displayManager.sddm.wayland.enable = true; # Set SDDM to wayland?

        # Extra Services
        services.geoclue2.enable = true; # Location service

        
        # Give apps the ability to run in realtime - helpful when busy?
        security.pam.loginLimits = [ 
          { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }  
        ];

        environment.systemPackages = with pkgs; [
            slurp # Screenshots - Sway
            wl-clipboard # Copy/Paste functions - Sway
            mako # Notification system - Sway
            wofi # Alternative Program launcher
            gammastep # screen temp control
            vivaldi # browser
            libreoffice-fresh # Libre Office
            hunspell # Spelling support
            hunspellDicts.en_GB-large # UK Dictionary
            gnome-logs # Gnome journalD viewer
        ];

        # Stylix Theming for environment
        stylix.enable = true;
        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
        stylix.polarity = "dark"; 
        
    };

}
