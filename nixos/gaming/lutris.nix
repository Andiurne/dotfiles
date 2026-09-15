{...}:{
  home-manager.users.andiurne.imports = [
  ({pkgs, ...}:{
    programs.lutris = {
      steamPackage = pkgs.millennium-steam;
      winePackages = [
        pkgs.wineWow64Packages.full
      ];
      enable = true;
    };
  })
  ];
  }
