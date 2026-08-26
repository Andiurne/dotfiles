{
  programs.virt-manager.enable = true;
  # I'm lazy
  users.groups.libvirtd.members = ["andiurne"];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  home-manager.users.andiurne.imports =
  [{
    dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
    };
  }];
}
