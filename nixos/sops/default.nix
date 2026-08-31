{
users.groups."keys" = {};

sops = {
  defaultSopsFile = ./secrets.yaml;
  age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  secrets = {
    STEAM_API_KEY ={
      group = "keys";
      mode = "440";
    };
    STEAM_GRID_DB_API_KEY = {
      group = "keys";
      mode = "440";
    };

    GH_TOKEN = {
      group = "keys";
      mode = "440";
    };
  };
};}
