codio-setup
===========

My codio project config files

Clone this repo into the /home/codio directory of a new codio project & then copy these various files into the /home/codio & /home/codio/workspace directories for new node projects

For debugging - npm install -g node-inspector
---------------------------------------------

For ungit - npm install -g ungit
--------------------------------

To switch to OH MY ZSH'''
-------------------------

echo "zsh && exit 0" >> ~/.bash_profile &&  curl -L http://install.ohmyz.sh | sh 

If using nvm be sure to add the following at end of ~/.zshrc file

source $HOME/.nvm/nvm.sh

then exit the terminal & re-connect


npm global modules
------------------
coffee-script
coffeelint
express-generator - for express apps
gulp
js2coffee
jshint
mocha
node-inspector
npm
ungit


other software
--------------
pip - parts install pip
linkchecker - pip install linkchecker
jq - wget http://stedolan.github.io/jq/download/linux64/jq - install into ~/ and then chmod +x ~/jq


add the fillowing lines to end of .zshrc
----------------------------------------
## my added stuff
alias jq="$HOME/jq"
alias linkchecker="$HOME/./.parts/packages/python2/2.7.6-2/bin/linkchecker"

# export API_KEYS - eg: Orchestrate, MongoLabs, Sendgrid, Mandrill, PasswordLess, StormPath etc...
export ORCHESTRATE_API_KEY="your-orchestrate-api-key"

# enable nvm for oh-my-zsh
source $HOME/.nvm/nvm.sh


                            
