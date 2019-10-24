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

# Configure git
git config --global user.name 'Payden Seibert'
git config --global user.email 'PQSeibert@gmail.com'

pushd ~/projects
git clone https://github.com/PQSeibert/machine_configuration
popd

# Configure sh
touch ~/.bashrc
touch ~/.bash_aliases

cp ~/projects/machine_configuration/bash/.bashrc ~
cp ~/projects/machine_configuration/bash/.bash_aliases ~

# Configure vim
touch ~/.vimrc

cp ~/projects/mashine_configuration/vim/.vimrc ~

# Configure tmux
touch ~/.tmux.conf

cp ~/projects/machine_configuration/tmux/.tmux.conf ~

# Configure python
pip install --upgrade pip
