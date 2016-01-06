# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# DEFAULT SETTINGS
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# Path
export BIN=/usr/local/bin
export PATH=/bin
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=$BIN:$PATH

# Fixes `pg` gem installation.
export ARCHFLAGS="-arch x86_64"

# Editor
export EDITOR=vim
export PATH=/usr/local/opt/vim/bin:$PATH
export PATH=/usr/local/Cellar/screen/4.3.0/bin:$PATH

export HISTIGNORE="&:[bf]g:c:exit"
export HISTCONTROL="ignoreboth"

# Executable files installed by PostgreSQL.
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH

# Executable files installed by npm in current directory.
export PATH=./node_modules/.bin:$PATH

# Executable files in current directory.
export PATH=./bin:$PATH

export PS1='\W 🤖  '

alias code="cd ~/Documents/code"
alias resafari="cd ~/Documents/code/resafari/resafari"
alias app="screen -c .screenrc"
