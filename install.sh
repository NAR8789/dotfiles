#!/bin/bash

# force-update my homedir symlinks

set -x

ln -srf zshrc ~/.zshrc
ln -srf vimrc ~/.vimrc
ln -srf vimrc ~/.screenrc

ln -srf redshift.conf ~/.config/redshift.conf
