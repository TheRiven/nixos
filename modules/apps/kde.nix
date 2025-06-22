
{
    pkgs,
    lib,
    config,
    ...
}:

{
    options = {
        apps.kde.enable = lib.mkEnableOption "enables KDE Apps";
    };

    config = lib.mkIf config.apps.kde.enable {
        environment.systemPackages = with pkgs; [
            kdePackages.filelight # Disk filesize tool
            kdePackages.kpat # Solitair card games
            kdePackages.kate # Code editor
        ];
    };

}
