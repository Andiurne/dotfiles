#!/usr/bin/env fish
#
# NOTE: Must be run from dotfiles
for dir in ./*/
	set -l bn (basename $dir)
	set -l confPath $XDG_CONFIG_HOME/$bn
	# Check for clobbering
	# If confPath is already a symlink
	if test -L $confPath
		echo "$bn is already symlinked, skipping..."
		continue
	else if test -d $confPath
		echo "Clobbering $bn, moving to $bn.bkp..."
		mv $confPath $confPath.bkp
	end

	# Symlink tracked config into place
	echo "Creating symlink at $confPath"
	ln -s (realpath $dir) $confPath
end
