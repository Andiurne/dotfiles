{config, pkgs, ...}:{

# NOTE: PCI bus IDs are hardware dependant :(
# This is for PRIME and such
hardware.nvidia = {
  open = true;
  prime = {
  	intelBusId = "PCI:0@0:2:0";
	  nvidiaBusId = "PCI:1@0:0:0";
	  offload = {
		  enable = true;
		  enableOffloadCmd = true;
	  };
  };
};

# Dual GPU Laptop Bullshit
hardware.graphics.enable = true;
services.xserver.videoDrivers = [
  "modesetting"
  "nvidia"
];
}
