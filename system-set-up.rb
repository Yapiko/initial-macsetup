#!/usr/bin/ruby

puts "Reading package list"

require 'json'

file = File.read('packages.json')

packages = JSON.parse(file)

caskPackages = packages['cask']

puts "Installing cask packages"

caskPackages.each { |package|
      puts `brew cask install #{package['name']}` if package['install']
}

brewPackages = packages['brew']

puts "Installing other packages"

brewPackages.each { |package|
      puts `brew install #{package['name']}` if package['install']
}

puts 'Changing Bash to Zsh'
exec 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
exec 'chsh -s /bin/zsh'

