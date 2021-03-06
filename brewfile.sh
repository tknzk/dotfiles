#!/bin/bash

set -eux

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
brew upgrade

# Add Repository
brew tap homebrew/versions
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap phinze/homebrew-cask
brew tap marcqualie/nginx

# Packages
brew install brew-cask

brew install git
brew install hub
brew install tig
brew install vim
brew install zsh
#brew install screen

#brew install ag
#brew install aspell
brew install autoconf
brew install automake
brew install autossh
brew install cmake
brew install coreutils
brew install findutils
#brew install gcc48
brew install gnu-sed
brew install gnu-tar
brew install go
#brew install groonga
#brew install groonga-normalizer-mysql
brew install htop-osx
brew install jq
#brew install keychain
brew install openssl
brew install pkg-config
brew install proctools
brew install pssh
brew install pstree
brew install readline
brew install sqlite
brew install ssh-copy-id
brew install tmux
brew install tree
brew install watch
brew install wget

brew install mysql
brew install postgresql
brew install redis

#brew install nginx
brew install nginx --with-debug --with-gnuzip --with-spdy --devel

brew install memcached

brew install s3cmd

brew install ngrep
brew install tcpflow
#brew install wireshark

brew install pyenv

brew install docker
brew install boot2docker
brew install docker-compose

#brew install packer

# .dmg
#brew cask install dropbox
#brew cask install firefox
#brew cask install google-chrome
#brew cask install google-japanese-ime
#brew cask install java
#brew cask install limechat
brew cask install vagrant
brew cask install virtualbox

# Required java
#brew install ec2-api-tools

# Remove outdated versions
brew cleanup
