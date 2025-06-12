
{pkgs, ...}:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    environment.systemPackages = with pkgs; [
        kdePackages.filelight # Disk filesize tool
        kdePackages.kpat # Solitair card games
        kdePackages.kate # Code editor
        nil # Nix language LSP for kate
        vivaldi # Browser
        lmms # DAW
        qmmp # Music Player
    ];

    # Install firefox.
    #programs.firefox.enable = true;

    # Git
    programs.git = {
        enable = true;
        config = {
            user.name = "James";
            user.email = "novajames276@gmail.com";
        };
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.

    # Enable vivaldi plasma connect with chromium
    programs.chromium.enable = true;
    programs.chromium.enablePlasmaBrowserIntegration = true;

    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

}
