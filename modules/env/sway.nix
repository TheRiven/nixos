
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
        #programs.seahorse.enable = true; # Gnome Keyring GUI
        programs.waybar.enable = true; # Waybar!
        #programs.nm-applet.enable = true; # GUI app for Networkmanager

        #services.gnome.gnome-keyring.enable = true;

        security.pam.services.riven.kwallet.enable = true;

        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
                    user = "greeter";
                };
            };
        };

        #services.mpd = {
        #    enable = true;
        #    musicDirectory = "~/Music";
        #    extraConfig = ''
        #        audio_output {
        #            type "alsa"
        #            name "ALSA"
        #            mixer_type "hardware"
        #            mixer_device "default"
        #            mixer_control "PCM"
        #        }
        #    '';
        #};

        security.pam.loginLimits = [
          { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }  
        ];

        environment.systemPackages = with pkgs; [
            slurp # Screenshots - Sway
            wl-clipboard # Copy/Paste functions - Sway
            mako # Notification system - Sway
            wofi # Alternative Program launcher
            kdePackages.kwallet # Password locker
            kdePackages.kwallet-pam # Pam Kwallet integration
            kdePackages.kwalletmanager # Kwallet manager
            cmus # console music player
        ];

        fonts = {
            packages = with pkgs; [
                font-awesome
                noto-fonts 
            ];
        };
        
    };

}
