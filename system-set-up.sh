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

echo "Adding aliases and functions in your bash"
count=$(grep -Fx "source ~/dev/src/systemsetup/functions.sh" ~/.zshrc | wc -l)

if [ $count -eq 0 ];then
	echo "\nsource ~/dev/src/systemsetup/functions.sh" >> ~/.zshrc
	echo "source ~/.zshrc"
else
	echo "Functions are already imported"
fi

echo "Done!"
