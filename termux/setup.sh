#!/bin/sh 
# Configure tooling. 
pkg upgrade
pkg install tree
pkg install vim
pkg install tmux
pkg install python
pkg install git
pkg install openssh

# Configure home
cd ~
mkdir projects
mkdir notes
mkdir scripts

mkdir data
ln -s ~/storage/external-1 ~/data/CARD
ln -s ~/storage/external-2 ~/data/USB

# Configure sh
touch ~/.bashrc
touch ~/.bash_aliases

# Configure vim
touch ~/.vim

# Configure tmux
touch ~/.tmux.conf

# Configure vscode

# Configure python
pip install --upgrade pip

