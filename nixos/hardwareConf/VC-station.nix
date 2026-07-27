{lib, pkgs, ...}: {
    imports = [
      ./VC-station_autogen.nix
    ];

    boot = {
      blacklistedKernelModules = [ "hyperv_fb" "hyperv_drm" ];
		  kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    };

    sops = {
      defaultSopsFile = ../secrets/vc-station.yaml;
      age = {
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        keyFile = "/home/devinr/.config/sops/age/keys.txt";
      };
      secrets = {
        example_key = {};
        example_number = {};
      };
    };

    nixpkgs.config.nvidia.acceptLicense = true;
    hardware.nvidia = {
      open = false;
      modesetting.enable = true;
    };

    #networking.firewall.allowedTCPPorts = [5900]; # For wayvnc

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig = {
        pipewire = {
         "91-null-and-vban" = {
           "context.modules" = [
            {name = "libpipewire-module-vban-send";
              args = {
                "local.ifname" = "eth0";
                "source.ip" = "10.42.139.228";
                "destination.ip" = "10.42.140.1";
                "destination.port" = 42000;
                "sess.name" = "VBAN Sink";
                "target.object" = "Main-Output-Proxy";
                "stream.props" = {
                  "node.name" = "VBAN-Sink";
                  "target.object" = "Main-Output-Proxy";
                };
              };}
           ];
           "context.objects" = [
           {
             factory = "adapter";
             args = {
               "factory.name" = "support.null-audio-sink";
               "node.name" = "Main-Output-Proxy";
               "node.description" = "Main Output";
               "media.class" = "Audio/Sink";
               "audio.position" = "FL,FR";
             };
           }
           ];
         };
         /*"rtp-sink" = {
           "context.modules" = [
             {
               "name" = "libpipewire-module-rtp-sink";
               "args" = {
                 "sess.name" = "NixOS RTP Broadcast";
                 "target.object" = "Main-Output-Proxy.monitor";
                 #"destination.ip" = "10.42.140.1";
                 "local.ifname" = "eth0";
                 #"source.ip" = "0.0.0.0";
                 "destination.port" = 46000;
                 #"net.mtu" = 1280;
                 #"net.loop" = true;
                 #"net.ttl" = 1;
                 "stream.props" = {
                   "node.name" = "rtp-sink";
                 };
               };
             }
           ];
          };*/
        };
        /*pipewire-pulse = {
          "pulse-rtp" = {
            "pulse.cmd" = [
              {
                cmd = "load-module";
                args = "module-null-sink sink_name=rtp_sink sink_properties=device.description=RTP_Network_Stream";
              }
              {
                cmd = "load-module";
                args = "module-rtp-send source=rtp_sink.monitor port=46000";
              }
            ];
          };
        };*/
      };
    };

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
    virtualisation.hypervGuest = {
      enable = true;
    };
  }
