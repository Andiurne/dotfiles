#!/usr/bin/env fish
# Note: must be run as sudo
sudo rm -r /etc/nixos
sudo cp -r nixos /etc/nixos

for folder in ./hyprcursors/*/
  set -l bn (basename $folder)
  ln -s (realpath $folder) ~/.icons/$bn
end
