{...}:
{services = {
  # Sound w/ pipewire
  # Pulse is probably on by default for compat
  pulseaudio.enable = false;
  pipewire = {
  enable = true;
  alsa = {
    enable = true;
    support32Bit = true;
  };
  pulse.enable = true;
  };
};}
