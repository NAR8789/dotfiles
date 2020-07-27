#!/bin/bash

# force-update my homedir symlinks

set -x

ln -srf zshrc ~/.zshrc
ln -srf vimrc ~/.vimrc
ln -srf vimrc ~/.screenrc

ln -srf config/redshift.conf ~/.config/redshift.conf
