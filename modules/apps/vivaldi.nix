
{
    pkgs,
    lib,
    config,
    ...
}:

{
    options = {
        apps.vivaldi.enable = lib.mkEnableOption "enables vivaldi";
        apps.vivaldi.plasma = lib.mkEnableOption "enables Vivaldi KDE plasma setup";
    };
    
    config = let
        vivaldiConfig = {
            enable = config.apps.vivaldi.enable;
            plasma = config.apps.vivaldi.plasma;
        };

    in
    {     
         lib.mkIf = config.apps.vivaldi.enable  {
             environment.systemPackages = with pkgs; [
                 vivaldi
             ];

             # Enable vivaldi plasma connect with chromium
             programs.chromium.enable = vivaldiConfig.plasma;
             programs.chromium.enablePlasmaBrowserIntegration = vivaldiConfig.plasma;
        };
    };  
        
}
