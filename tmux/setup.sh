#!/bin/bash

install_config() {
	echo "Copying $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.tmux.conf"
	cp $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.tmux.conf ~/.tmux.conf
	echo "tmux config file copied succesfully"
}


install_config
