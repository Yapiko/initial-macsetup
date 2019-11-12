#!/bin/sh

echo "Unistalling cask packages"
for package in $(brew cask list)
do
  echo "$package"
  brew cask uninstall $package
done

echo "Unistalling brew packages"
for package in $(brew list)
do
  echo "$package"
  brew uninstall $package
done

echo "Unistalling Homebrew"
rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

echo "Done"
