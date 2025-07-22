
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

        services.gnome.gnome-keyring.enable = true; # Password Keyring

        services.displayManager.sddm.enable = true; # greeter with UWSM support
        services.displayManager.sddm.wayland.enable = true; # Set SDDM to wayland?

        
        # Give apps the ability to run in realtime - helpful when busy?
        security.pam.loginLimits = [ 
          { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }  
        ];

        environment.systemPackages = with pkgs; [
            slurp # Screenshots - Sway
            wl-clipboard # Copy/Paste functions - Sway
            mako # Notification system - Sway
            wofi # Alternative Program launcher
            cmus # console music player
        ];

        fonts = {
            packages = with pkgs; [
                font-awesome
                noto-fonts
                noto-fonts-cjk-sans
                noto-fonts-emoji
                dejavu_fonts 
            ];
        };
        
    };

}
