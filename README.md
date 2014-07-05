codio-setup
===========

My codio project config files

Clone this repo into the /home/codio directory of a new codio project & then copy these various files into the /home/codio & /home/codio/workspace directories for new node projects

For debugging - npm install -g node-inspector


To switch to OH MY ZSH

echo "zsh && exit 0" >> ~/.bash_profile &&  curl -L http://install.ohmyz.sh | sh 

then exit the terminal & re-connect

To install nvm - comment out zsh in ~/.bash_profile, reload terminal and instal nvm

curl https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh | bash


If using nvm be sure to add the following at end of ~/.zshrc file

source $HOME/.nvm/nvm.sh
