PWD := $(CURDIR)
HOME_DOTFILES := ${XDG_CONFIG_HOME}/system/home-dotfiles

.DEFAULT_GOAL := help

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initialize and backup your configuration
	@for item in $(shell cat $(HOME_DOTFILES)); do \
		diff_output=$$(diff ${HOME}/$$item ${PWD}/$$item); \
		if [ -n "$$diff_output" ]; then \
			dir=$$(dirname ${PWD}/$$item); \
			if [ ! -d $$dir ]; then mkdir -p $$dir; fi; \
			cp -v ${HOME}/$$item ${PWD}/$$item; \
		else \
			echo "No changes in ${HOME}/$$item"; fi; \
	done
