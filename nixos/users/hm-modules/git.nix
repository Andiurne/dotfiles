{pkgs, ...}:{


programs.git = {
    enable = true;
    package = pkgs.git.override { withLibsecret = true;};
    settings = {
        init.defaultBranch = "main";
        credential.helper = "libsecret";
        user = {
            email = "andiurne@gmail.com";
            name = "Andiurne";
        };
    };
};

}
