
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
        ];
  };

}
