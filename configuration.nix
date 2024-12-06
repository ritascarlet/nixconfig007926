###########################
### NIXOS CONFIGURATION ###
###########################
{ config, lib, pkgs, ... }:

###############
### IMPORTS ###
###############
{
  imports =
    [
      	./hardware-configuration.nix
      	./packages.nix
	./nvidia.nix
	./hyprland.nix
    ];

##################
### BOOTLOADER ###
##################
	#OPTIONS
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	#MODULES
	boot.extraModulePackages = with config.boot.kernelPackages ; [ amneziawg ] ;
	#LINUX-ZEN
	boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
 
################
### HOSTNAME ###
################
	networking.hostName = "nixos";

##############
### FLAKES ### 
##############

	nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

###############
### NETWORK ###
###############
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  	networking.networkmanager.enable = true;

###############
### LOCALES ###
###############

  time.timeZone = "Europe/Moscow";
 
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

##############
### KEYMAP ###
##############
	services.xserver.xkb = {
    		layout = "us";
    		variant = "";
  	};

############
### SDDM ###
############

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
  
##########  
### ME ###
##########

  	users.users.saya = {
    		isNormalUser = true;
    		description = "saya";
    		extraGroups = [ "networkmanager" "wheel" ];
    		packages = with pkgs; [];
  	};
#######################
### UNFREE PACKAGES ###
#######################

	nixpkgs.config.allowUnfree = true;

  
################
### PIPEWIRE ###
################
	security.rtkit.enable = true;
  	services.pipewire = {
    		enable = true;
    		alsa.enable = true;
    		alsa.support32Bit = true;
    		pulse.enable = true;
    		jack.enable = true;
  	};
	 
#####################
### NIXOS VERSION ###
#####################

	  system.stateVersion = "25.05"; # Did you read the comment?

##############
### CACHIX ###
##############
	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
    		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  	};

########################
### OPENTABLETDRIVER ###
########################

	hardware.opentabletdriver.enable = true;
	hardware.opentabletdriver.daemon.enable = true;
#############
### STEAM ###
#############

	programs.steam = {
                enable = true;
                remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
                dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
                localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

}	
