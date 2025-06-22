
{
    pkgs,
    ...
}:

{
    imports = [
        ./apps/vivaldi.nix
    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    environment.systemPackages = with pkgs; [
        kdePackages.filelight # Disk filesize tool
        kdePackages.kpat # Solitair card games
        kdePackages.kate # Code editor
        nil # Nix language LSP for kate
        lmms # DAW
        qmmp # Music Player
        fastfetch # Fastfetch cli tool
        helix # CLI code/text editor
        lazygit # TUI Git client
        alacritty # alacritty terminal emulator
    ];

    # Install firefox.
    #programs.firefox.enable = true;
    apps.vivaldi.enable = true;

    # Git
    programs.git = {
        enable = true;
        config = {
            user.name = "James";
            user.email = "novajames276@gmail.com";
        };
    };

    # Install fish shell
    programs.fish.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.

    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

}
