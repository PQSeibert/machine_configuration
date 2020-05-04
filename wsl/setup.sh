#!bin/sh
# Configure packages
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install \
  vim \
  tree \
  tmux

# Install docker (wsl bionc)
sudo apt-get -y remove docker docker-engine docker.io runc
sudo apt-get -y install docker.io
# TODO: setup remote docker deamon into config
sudo docker run hello-world

# Configure home
cd ~
mkdir projects

# Configure git
git config --global user.name 'Payden Seibert'
git config --global user.email 'PQSeibert@gmail.com'

pushd ~/projects
git clone https://github.com/PQSeibert/machine_configuration
popd

# Configure sh
touch ~/.bashrc
touch ~/.bash_aliases

cp ~/projects/machine_configuration/bash/bashrc ~/.bashrc
cp ~/projects/machine_configuration/bash/bash_aliases ~/.bash_aliases

# Configure vim
touch ~/.vimrc
mkdir ~/.vim/colors

cp ~/projects/machine_configuration/vim/vimrc ~/.vimrc
cp ~/projects/machine_configuration/vim/colors/badwolf.vim ~/.vim/colors/badwolf.vim

# Configure tmux
touch ~/.tmux.conf

cp ~/projects/machine_configuration/tmux/tmux.conf ~/.tmux.conf
