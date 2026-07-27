{config, ...}:{sops =
{
  defaultSopsFile = ./secrets/sops.yaml;
  defaultSopsFormat = "yaml";

  age ={
    #sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    keyFile = "/run/secrets.d/age-keys.txt";
    generateKey = true;
  };

  # Accessible at /run/user/<uid>/, which is %r
  secrets = {
    STEAM_API_KEY = {};
  };
};}
