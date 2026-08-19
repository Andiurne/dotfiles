{pkgs, ...}:{
  users.users.andiurne.packages = with pkgs; [ warpinator ];
  networking.firewall = {
	enable = true;
	allowedTCPPorts = [ 42000 42001 ];
  };
}
