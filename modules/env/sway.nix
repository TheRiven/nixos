
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
        };

        programs.thunar.enable = true; # File Manager
        programs.seahorse.enable = true; # Gnome Keyring GUI
        programs.waybar.enable = true; # Waybar!
        programs.nm-applet.enable = true; # GUI app for Networkmanager

        services.gnome.gnome-keyring.enable = true;

        security.pam.loginLimits = [
          { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }  
        ];

        environment.systemPackages = with pkgs; [
            slurp # Screenshots - Sway
            wl-clipboard # Copy/Paste functions - Sway
            mako # Notification system - Sway
            wofi # Alternative Program launcher
            font-awesome # Awesome OTF font
        ];
    };

}
