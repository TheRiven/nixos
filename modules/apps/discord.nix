
{
    pkgs,
    lib,
    config,
    ...
}:

{
    options = {
        apps.discord.enable = lib.mkEnableOption "enables Discord Client";
    };

    config = lib.mkIf config.apps.discord.enable {
        environment.systemPackages = with pkgs; [
            discord
        ];
    };

}
