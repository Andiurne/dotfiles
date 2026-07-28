{config, ...}:{sops =
{
  defaultSopsFile = ./secrets/sops.yaml;
  defaultSopsFormat = "yaml";

  age ={
    sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };

  # Accessible at /run/user/<uid>/, which is %r
  secrets = {
    STEAM_API_KEY = {};
  };
};}
