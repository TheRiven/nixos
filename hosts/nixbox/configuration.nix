{
  #config,
  pkgs,
  #inputs,
  ...
}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  ## --- CORE --- ##

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages;

  ## --- NETWORK --- ##

  networking.hostName = "nixbox"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  ## --- DESKTOP ENV --- ##

  # Enable the KDE Plasma Desktop Environment.
  env.plasma6.enable = true;
  
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  ## --- SERVICES -- ##

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # services.jellyfin.enable = true;

  ## --- NIX --- ##

  # Actiate Nix Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set nix garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "07:00";
  nix.gc.options = "--delete-older-than 5d";

  ## --- APPS --- ##

  programs.nix-ld.enable = true; # Enables nix dynamic linker
  apps.kde.enable = true;


  # Initial NixOS version -- DO NOT CHANGE
  system.stateVersion = "25.05";

}
