# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Go
export GOPATH="$HOME/Dev/Go"
export PATH="$GOPATH/bin:$PATH"

# NVM
 export NVM_DIR="$HOME/.nvm"
  . $(brew --prefix nvm)/nvm.sh

# RVM
source $HOME/.rvm/scripts/rvm
