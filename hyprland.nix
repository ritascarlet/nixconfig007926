################
### HYPRLAND ###
################
{inputs, pkgs, ...}: {
	programs.hyprland = {
    		enable = true;
		withUWSM = true;
		xwayland.enable = true;
		
	};
}
