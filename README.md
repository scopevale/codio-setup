codio-setup
===========

My codio project config files

Clone this repo into the /home/codio directory of a new codio project & then copy these various files into the /home/codio & /home/codio/workspace directories for new node projects


To switch to OH MY ZSH'''
-------------------------

`echo "zsh && exit 0" >> ~/.bash_profile &&  curl -L http://install.ohmyz.sh | sh` 

Be sure to apend the .zshrc-footer to end of ~/.zshrc file - adds some aliases, paths & ENV vars

`cat ~/codio-setup/.zshrc-footer >> ~/.zshrc`

then exit the terminal & re-connect


install iojs
------------

first replace nvm with critionix version

`curl https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh | zsh`

then, install iojs

`nvm install iojs`

alias as default

`nvm alias default iojs`

npm global modules
------------------

modules for all projects

`npm i -g bower jshint mocha gulp yo ungit`

additonal modules - optional

coffee-script coffeelint js2coffee - for coffeescript projects

express-generator - for express apps

generator-ko - for koa apps -- `yo koa`

node-inspector

other software
--------------

pip - `parts install pip`

linkchecker - `pip install linkchecker`

jq - `wget http://stedolan.github.io/jq/download/linux64/jq` - install into ~/ and then `chmod +x ~/jq`

mongodb setup
-------------

-- add this to your .zshrc

`
# start mongodb                                                                                                   
export MONGOSTAT="`parts status mongodb`"                                                                         
if [ $MONGOSTAT = 'mongodb STOPPED' ]                                                                             
then                                                                                                              
    parts start mongodb                                                                                           
fi
`

