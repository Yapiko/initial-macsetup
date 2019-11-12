#!/bin/sh
echo "Installing Homebrew cask"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
echo "Homebrew cask installed"

echo "Installing jenkins api client gem"
sudo gem install jenkins_api_client
echo "jenkins api client gem installed"

echo "Running system setup ruby script"
ruby system-set-up.rb
echo "system setup ruby script finished"

echo "Done!"
