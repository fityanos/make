.DEFAULT_GOAL :=installApps

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
	@echo "	Available Tasks =>"
	@echo "	prepare              test prepare"
	@echo "	installApps              install Apps Automation dependencies"
	@echo ""

prepare:
	@echo "test prepare"

installApps:
	$(info Check which OS)
	@echo $(OPERATING_SYSTEM)
	@echo $(IS_SELENIUM_INSTALLED)
ifeq ($(OPERATING_SYSTEM), MAC)
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install node
	npm install -g appium
	npm install wd
	appium &
else
	sudo apt-get install wget
endif