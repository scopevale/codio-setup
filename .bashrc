# process.env VARIABLES for codio & heroku
declare -x TVDB_APIKEY='9999999999999'
declare -x MONGOLAB_URI='mongodb://<user>:<password>@ds029827.mongolab.com:29827/<database>'
declare -x SMTP_USER='user'
declare -x SMTP_PASS='password'

# Alias definitions.
# You may want to put all your additions into a separate file like
# $HOME/workspace/.bash_aliases, instead of adding them here directly.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
