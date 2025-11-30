#!/bin/bash

install_packages() { 
	REQUIREMENTS_FILE="requirements.txt"
	PACKAGE_MANAGER=""
	UPDATE_CMD=""
	INSTALL_CMD=""

	if command -v apt &> /dev/null; then
	    PACKAGE_MANAGER="apt"
	    UPDATE_CMD="sudo apt update"
	    INSTALL_CMD="sudo apt install -y"
	elif command -v dnf &> /dev/null; then
	    PACKAGE_MANAGER="dnf"
	    UPDATE_CMD="sudo dnf update" 
	    INSTALL_CMD="sudo dnf install -y"
    	else
		echo "Error: couldn't find any supported package manager (apt, dnf)"
		exit 1
	fi

	echo "Detected package manager: **$PACKAGE_MANAGER**"

	# Parse the requirements file avoiding comments and empty lines
	PACKAGES_TO_INSTALL=$(grep -vE '^\s*(#|$)' "$REQUIREMENTS_FILE" | tr '\n' ' ')

	echo "Updating package list ..."
	$UPDATE_CMD

	echo "Installing packages: $PACKAGES_TO_INSTALL"
	$INSTALL_CMD $PACKAGES_TO_INSTALL

	if [ $? -eq 0 ]; then
		echo "SUCCESS: All packages have been installed"
	else
		echo "INSTALLATION FAILED: some packages could not been installed"
	fi
}

install_packages

source ./keyd/setup.sh
