##############
### NVIDIA ###
##############
{ config, lib, pkgs, ... }: { 

        hardware.graphics = {
                enable = true;
        };

        hardware.nvidia = {
                modesetting.enable = true;
                powerManagement.enable = false;
                powerManagement.finegrained = false;
                open = false;
                nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
                hardware.graphics.enable32Bit = true;
	
	services.xserver.videoDrivers = ["nvidia"];	

}
