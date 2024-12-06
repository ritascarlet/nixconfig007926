{ pkgs, ... }: { 

	environment.systemPackages = with pkgs; [
    		(lutris.override {
      		extraLibraries =  pkgs: [
		wineWowPackages.stable
		wine        
		];
	})
];

	environment.systemPackages = with pkgs; [
    		(lutris.override {
       		extraPkgs = pkgs: [
		wineWowPackages.stable
		wine
       		];
    	})
];

}
