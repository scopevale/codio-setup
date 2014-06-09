alias rm='rm -i'
alias l.='ls -d .*'
alias ll='ls -l'
alias ls='ls -Fal'
alias cls='clear'
alias h='history'
alias hg='history | grep'

# return the top 10 history commands by frequency
function hc
{
        history | sed 's/^ \+//;s/  / /' | cut -d' ' -f2- | awk '{ count[$0]++ } END { for (i in count) print count[i], i }' | sort -rn | he
ad -10
}

# cat /dev/null to a file $1
function cdn
{
        FILE=$1

        if [ ! -f $FILE ]
        then
                echo "the file $FILE does not exist"
        else
                cat /dev/null >  $FILE
        fi
}

# lowercase a string
function lc
{
        echo $1 | sed -e 's/\(.*\)/\L\1/'
}

# uppercase a string
function uc
{
        echo $1 | sed -e 's/\(.*\)/\U\1/'
}

# lxp - convert a DOS file path to *nix style
function lxp
{
        $a = '\/'
        echo $1 | sed -e 's#\\#$a#'
}
