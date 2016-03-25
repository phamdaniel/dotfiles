#!/bin/bash

# Ask for admin upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install more recent version of some OSX tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install zsh

# Useful binaries
brew install ack
brew install cask
brew install ctags
brew install git
brew install git-lfs

# Useful languages
brew install lua
brew install python
brew install java

# Useful applications
brew cask install google-chrome
brew cask install google-drive
brew cask install spectacle
brew cask install flux
brew cask install xee
brew cask install caprine
brew cask install slack
brew cask install adobe-reader
brew cask install evernote
brew cask install transmission
brew cask install atom
brew cask install vlc
brew cask insatll paintbrush
