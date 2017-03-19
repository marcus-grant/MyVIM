#!/bin/bash

path="$(pwd)"
vundlePath="$path/bundle/Vundle.vim"
bundlePath="$path/bundle"

echo
echo "Preparing vim environment using a seperate dotfile folder"
echo

if [ -d $vundlePath ]; then
	echo "Removing old Vundle submodule"
	rm -rf $vundlePath
	echo
fi

echo "Clone Vundle into its Vundle path"
git clone https://github.com/VundleVim/Vundle.vim.git $vundlePath
echo

echo "Modifying .vimrc to reflect new runtime location of Vundle"
sed -i '5s:.*:set rtp+='$vundlePath':' .vimrc
sed -i '9s:.*:call vundle#begin('\'$bundlePath\''):' .vimrc
echo

echo "Linking local .vimrc to home .vimrc"
if [ -f ~/.vimrc ]; then
	echo "Previous .vimrc exists!"
	echo "Making backup named ~/.vimrc.bak"
	rm ~/.vimrc.bak
	mv ~/.vimrc ~/.vimrc.bak
fi
if [ -L ~/.vimrc ]; then
	echo "Previous .vimrc link exists, re-linking!"
	rm ~/.vimrc
fi

ln -s $path/.vimrc ~/.vimrc
echo

echo "Launching vim with \'PluginInstall\' command to update bundles"
vim +PluginInstall +qall
echo

echo "Copying colorschemes into colorscheme bundle"
cp extra-colors/* bundle/vim-colorschemes/colors
echo

echo "Environment setup for vim complete!"
