OLD_PWD := $(PWD)
PWD := $(CURDIR)
HOME_DOTFILES := system/home-dotfiles
DEVICE_SELECTED := $(shell gum choose $$(lsblk -nd -o NAME))

.DEFAULT_GOAL := help

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initialize and backup your configuration
	@for item in $(shell cat ${XDG_CONFIG_HOME}/$(HOME_DOTFILES)); do \
		if [ -n "$$(diff ${HOME}/$$item ${PWD}/$$item 2>/dev/null)" ] || [ ! -e ${PWD}/$$item ]; then \
			dir=$$(dirname ${PWD}/$$item); \
			if [ ! -d $$dir ]; then mkdir -p $$dir; fi; \
			cp -v ${HOME}/$$item ${PWD}/$$item; fi; \
	done

deploy: ## Deploy the configuration from local repo to home
	@for item in $(shell cat ${PWD}/$(HOME_DOTFILES)); do \
		diff_output=$$(diff ${HOME}/$$item ${PWD}/$$item); \
		if [ -n "$$diff_output" ]; then \
			dir=$$(dirname ${PWD}/$$item); \
			if [ ! -d $$dir ]; then mkdir -p $$dir; fi; \
			cp -v ${HOME}/$$item ${PWD}/$$item; \
		else \
			echo "No changes in ${HOME}/$$item"; fi; \
	done

diff: ## Check if there's a difference between local changes and local repo
	diff -r $(OLD_PWD) ${PWD}/$$(realpath --relative-to=${HOME} $(OLD_PWD))

btrfs: ## Format various drives to btrfs
	echo "Choose the drive you want to install Void Linux to:"
	echo "Void Linux will be installed on /dev/${DEVICE_SELECTED}"
	echo "Creating GPT Partition Table for /dev/${DEVICE_SELECTED}"
	echo "label: gpt" | sfdisk /dev/${DEVICE_SELECTED}
	echo "Set the partition size for /boot"
	boot_size=$$(gum input --placeholder 512M --value 512M); \
	echo "Creating boot partition"; \
	echo ',$${boot_size}, U;' | sfdisk /dev/${DEVICE_SELECTED}
	mkfs.vfat -n BOOT /dev/${DEVICE_SELECTED}1
	echo "Set the partition size for swap"
	swap_size=$$(gum input --placeholder 8GB); \
	echo "Creating swap partition";\
	echo ',$${swap_size}, S;' | sfdisk /dev/${DEVICE_SELECTED}
	mkswap -L SWAP /dev/${DEVICE_SELECTED}2
	echo "Set the partition size for home"
	home_size=$$(gum input); \
	echo "Creating home partition"; \
	echo ',$${home_size}, L;' | sfdisk /dev/${DEVICE_SELECTED}
	mkfs.btrfs -L HOME /dev/${DEVICE_SELECTED}3
	echo "Set the partition size for root"
	root_size=$$(gum input); \
	echo "Creating root partition"; \
	echo ',$${root_size}, L;' | sfdisk /dev/${DEVICE_SELECTED}
	mkfs.btrfs -L ROOT /dev/${DEVICE_SELECTED}4
