
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

        services.gnome.gnome-keyring.enable = true;

        environment.systemPackages = with pkgs; [
            slurp # Screenshots - Sway
            wl-clipboard # Copy/Paste functions - Sway
            mako # Notification system - Sway
        ];
    };

}
