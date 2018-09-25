# Default
alias cat=bat

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Directories
alias dotfiles="cd $DOTFILES"
alias gogo="cd $HOME/Dev/Go"

# Laravel
alias artisan="php artisan"

# Docker
dclean() { docker rm -v $(docker ps -a -q -f status=exited) }
diclean() { docker rmi $(docker images -f "dangling=true" -q) }
dbuild() { docker build -t=$1 .; }
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
