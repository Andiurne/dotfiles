{pkgs, ...}:{programs.gh = {
enable = true;
gitCredentialHelper.enable = false;
extensions =
[
    pkgs.gh-notify
];
};}
