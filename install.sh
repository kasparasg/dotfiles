#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install PHP extensions with PECL
pecl install imagick

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Dev directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Dev
mkdir $HOME/Dev/Personal
mkdir $HOME/Dev/Work

mkdir $HOME/Dev/Go
mkdir $HOME/Dev/Go/src
mkdir $HOME/Dev/Go/pkg
mkdir $HOME/Dev/Go/bin

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Install Spaceship prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink .gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
