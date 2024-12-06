####################
### NIX PACKAGES ###
####################
{ pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
	
	#Applications
	steam
        google-chrome   
	osu-lazer-bin
	lutris
		
	#AmneziaWg
        amneziawg-go
        amneziawg-tools
        linuxKernel.kernels.linux_zen
        linuxKernel.packages.linux_zen.amneziawg
	
	#Software
	pavucontrol
	hyprpaper
	rofi-wayland
	kitty
	nautilus
	neofetch
	hyprlandPlugins.csgo-vulkan-fix
	git 
	wget 
	zenity
	xdg-desktop-portal	
	egl-wayland
	
	#Gtk and etc
	glib
	adwaita-icon-theme
	papirus-icon-theme
	adw-gtk3	
	nwg-look

	#Какие-то рандом зависимости
	tinysparql
	egl-wayland

	#Discord canary with Vencord
        (discord-canary.override {
        withVencord = true;
        })


	];

}

