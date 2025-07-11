
{
    pkgs,
    ...
}:

{
    imports = [
        ./apps/vivaldi.nix
        ./apps/kde.nix
    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    environment.systemPackages = with pkgs; [
        nil # Nix language LSP server
        lmms # DAW
        qmmp # Music Player
        fastfetch # Fastfetch cli tool
        bat # Better version of Cat
        helix # CLI code/text editor
        lazygit # TUI Git client
        alacritty # alacritty terminal emulator
        yt-dlp # Video downloader
        btop # System monitor
        slurp # Screenshots - Sway
        wl-clipboard # Copy/Paste functions - Sway
        mako # Notification system - Sway
    ];

    # Git
    programs.git = {
        enable = true;
        config = {
            user.name = "James";
            user.email = "novajames276@gmail.com";
        };
    };

    # Nix Helper (NH)
    programs.nh.enable = true;

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
