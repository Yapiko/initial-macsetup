#!/bin/sh
echo "Installing Homebrew cask"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
echo "Homebrew cask installed"

echo "Installing jenkins api client gem"
sudo gem install jenkins_api_client
echo "jenkins api client gem installed"

echo "Running system setup ruby script"
ruby system-set-up.rb
echo "system setup ruby script finished"

# SDK Man stuff
curl -s https://get.sdkman.io | bash
source ~/.sdkman/bin/sdkman-init.sh

for version in $(sdk list java | grep amzn | cut -d'|' -f 6); do
	echo "Installing java version $version"
	sdk install java $version
done

sdkmanpackages=( "maven" "gradle" )
for package in ${!sdkmanpackages[@]}; do
	sdk install "${sdkmanpackages[$package]}"
done

echo "Done!"