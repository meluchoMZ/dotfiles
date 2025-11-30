#!/bin/bash

install_config() {
	echo "Cloning keyd repository..."
	git clone --depth 1 --branch v2.5.0 https://github.com/rvaiya/keyd ~/git/keyd
	CURRENT_WORKING_DIR=$(pwd)
	cd ~/git/keyd
	make && sudo make install
	cd $CURRENT_WORKING_DIR
	sudo systemctl enable --now keyd
	sudo sysetmctl start keyd

	echo "Copying $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/default.conf"
	sudo cp $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/default.conf /etc/keyd/default.conf 
	echo "Keyd config file copied succesfully"
	echo "Performing systemctl configuration for Keyd ..."
	sudo systemctl restart keyd
}


install_config
