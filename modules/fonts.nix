{
    pkgs,
	...
}:

{
    fonts = {
        packages = with pkgs; [
            font-awesome
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-emoji
            dejavu_fonts
            nerd-fonts.iosevka-term
            nerd-fonts.noto
        ];
    };

}
