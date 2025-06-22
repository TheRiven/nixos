
{
    pkgs,
    lib,
    config,
    ...
}:

{
    options = {
        apps.vivaldi.enable = lib.mkEnableOption "enables vivaldi";
    };

    config = lib.mkIf config.apps.vivaldi.enable {
        environment.systemPackages = with pkgs; [
            vivaldi
        ];

        # Enable vivaldi plasma connect with chromium
        programs.chromium.enable = true;
        programs.chromium.enablePlasmaBrowserIntegration = true;
    };
}
