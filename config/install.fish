#!/usr/bin/env fish
#
# NOTE: Must be run from dotfiles
for dir in ./*/
	set -l bn (basename $dir)
	set -l confPath ~/.config/$bn

	# Check for clobbering
	# If confPath is already a symlink
	if test -L $confPath
		echo "$confPath is already a symlink, skipping..."
		continue
	else if test -d $confPath
		echo "Clobbering $bn, moving to $bn.bkp..."
		mv $confPath $confPath.bkp
	end

	# Symlink tracked config into place
	echo "Creating symlink at $confPath"
	ln -s (realpath $dir) $confPath
end
