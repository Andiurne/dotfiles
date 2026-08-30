{...}:
{
    programs.keepassxc = {
        enable = true;
        # A settings option is provided for writing
        # config, but kpxc reads and writes to this
        # constantly, and reads ONLY this file,
        # so it doesn't work as of 6/30/2026
        # settings = {};
    };
    programs.git-credential-keepassxc = {
        enable = true;
        hosts =
        [
            "https://github.com"
        ];
    };
}
