export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export UF_DIR=/Users/maynkj/code/universitetsforlaget

source ~/.bashrc
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source $UF_DIR/scripts/infrastructure/utils/bash_functions.sh

ssh-add ~/.ssh/*.pem
