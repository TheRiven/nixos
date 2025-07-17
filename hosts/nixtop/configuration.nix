# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
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
  #boot.loader.systemd-boot.enable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages;

  ## --- NETWORK --- ##

  networking.hostName = "nixtop"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  ## --- DESKTOP ENV --- ##

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  env.sway.enable = true;
  
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

  # Graphics Card settings
  hardware.graphics.enable = true;
  hardware.nvidia.open = false;
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_340;
  services.xserver.videoDrivers = ["nvidia"];
  
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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # services.jellyfin.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  ## --- NIX --- ##

  # Actiate Nix Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set nix garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "07:00";
  nix.gc.options = "--delete-older-than 5d";

  ## --- APPS --- ##
    
  # Set apps to enable on host
  #programs.firefox.enable = true;
  programs.nix-ld.enable = true; # Enables nix dynamic linker
  programs.steam.enable = true;
  apps.vivaldi.enable = true;
  apps.kde.enable = true;
  apps.discord.enable = true;


  # Initial NixOS version -- DO NOT CHANGE
  system.stateVersion = "25.05";

}
