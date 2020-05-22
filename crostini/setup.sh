#!/bin/bash
# Configure packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get remove docker docker-engine docker.io runc
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  tree \
  gnupg2 \
  software-properties-common

# Configure docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

# Get docker images
sudo docker pull python
sudo docker pull golang
sudo docker pull kalilinux/kali
sudo docker pull postgres

# Configure home
cd ~
mkdir projects

ls -s /mnt/chromeos/removable/ data

# Configure git
git config --global user.name 'Payden Seibert'
git config --global user.email 'PQSeibert@gmail.com'

pushd ~/projects
git clone https://github.com/PQSeibert/machine_configuration
popd

# Configure sh
touch ~/.bashrc
touch ~/.bash_env
touch ~/.bash_aliases

cp ~/projects/machine_configuration/bash/bashrc ~/.bashrc
cp ~/projects/machine_configuration/bash/bash_env ~/.bash_env
cp ~/projects/machine_configuration/bash/bash_aliases ~/.bash_aliases

# Configure vim
mkdir ~/.vim
mkdir ~/.vim/colors
mkdir ~/.vim/pack
mkdir ~/.vim/pack/plugins
mkdir ~/.vim/pack/plugins/start

cp ~/projects/machine_configuration/vim/vimrc ~/.vim/.vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

cp ~/projects/machine_configuration/vim/colors/badwolf.vim ~/.vim/colors/badwolf.vim

pushd ~/.vim/pack/plugins/start
git clone https://github.com/terryma/vim-multiple-cursors.git
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/dense-analysis/ale.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/itchyny/lightline.vim.git
popd

# Configure tmux
touch ~/.tmux.conf

cp ~/projects/machine_configuration/tmux/tmux.conf ~/.tmux.conf

# Configure vscode

# Configure dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
