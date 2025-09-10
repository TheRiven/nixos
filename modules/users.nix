
{
    pkgs,
    ...
}:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.riven = {
        isNormalUser = true;
        description = "James";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.fish;
        packages = with pkgs; [
            astroterm # Celestial viewer
            kdePackages.filelight # Disk filesize tool
            kdePackages.kpat # Solitair card games
            kdePackages.kate # Code editor
            ols # Odin Languge LSP server
            taplo # TOML LSP
            lmms # DAW
            gimp3 # GIMP image editor
            odin # Odin Programing language
            yt-dlp # Video downloader
            bitwarden-desktop # bitwarden password manager
        ];

        programs.chromium.extensions =
        [
            # Bitwarden extension
            "nngceckbapebfimnlniiiahkandclblb"
        ];

  };

}
