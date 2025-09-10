
{
    pkgs,
    ...
}:

{
    imports = [
        #./apps/kde.nix
        ./apps/discord.nix
    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    environment.systemPackages = with pkgs; [
        nil # Nix language LSP server
        cmus # console music player
        fastfetch # Fastfetch cli tool
        bat # Better version of Cat
        helix # CLI code/text editor
        alacritty # alacritty terminal emulator
        btop # System monitor
    ];

    # Git
    programs.git = {
        enable = true;
        config = {
            user.name = "James";
            user.email = "novajames276@gmail.com";
        };
    };

    programs.chromium.extensions =
    [
        # Bitwarden extension
        "nngceckbapebfimnlniiiahkandclblb"
    ];

    # TUI Git Client
    programs.lazygit.enable = true;

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
