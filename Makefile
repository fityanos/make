.DEFAULT_GOAL :=brew

#	to check I use the command cat -e -t -v makefile_name

OPERATING_SYSTEM :=
ifeq ($(OS),Windows_NT)
	OPERATING_SYSTEM = WIN
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OPERATING_SYSTEM = LUNIX
	endif
	ifeq ($(UNAME_S),Darwin)
		OPERATING_SYSTEM = MAC
	endif
endif

help:
	@echo ""
	@echo "Available Tasks =>"
	@echo "brew               install brew on your mac"
	@echo "zsh                install zsh on your mac"
	@echo "curl               install curl on your mac"
	@echo "php                install php on your mac"
	@echo "node               install node on your mac"
	@echo "git                install git on your mac"
	@echo "java               install java on your mac"
	@echo "cypress            install cypress.io on your mac"
	@echo "codeception        install and configure codeception on your mac"

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

zsh:
	brew install zsh zsh-completions

curl:
	brew install curl

php:
	brew install php

node:
	brew install node

git:
	brew install git

java:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
	brew tap caskroom/versions
	brew update
	brew cask install java8
	brew install carthage

cypress:
	npm install cypress --save-dev

codeception:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	composer require codeception/codeception --dev
	php vendor/bin/codecept bootstrap
	php vendor/bin/codecept generate:suite api
	codecept build