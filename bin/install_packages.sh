#!/bin/sh

AUR_MANAGER=paru

printf "Installing packages from packages.txt\n\n"


# If yay is found in the system
if $(which $AUR_MANAGER &> /dev/null) ; then
	printf "Using $AUR_MANAGER\n\n"
	# update packages databases
	$AUR_MANAGER -Sy
	
	# install all the packages in the packages.txt
	$AUR_MANAGER -Sd $(cat packages.txt)


# If yay is not found in the system but pacman is
elif $(which pacman &> /dev/null) ; then
	printf "Using pacman \n\n"
	# update packages databases
	sudo pacman -Sy
	# install all the packages in the packages.txt
	sudo pacman -S $(cat packages.txt)

# If none of the above are not found in the system but apt is
elif $(which apt &> /dev/null) ; then
	printf "Using apt \n\n"
	# update packages databases
	sudo apt update
	# install all the packages in the packages.txt
	sudo apt install $(cat packages.txt)
	
# If none of the above are not found in the system but dnf is
elif $(which dnf &> /dev/null) ; then
	printf "Using dnf \n\n"
	# update packages databases
	sudo dnf update
	# install all the packages in the packages.txt
	sudo dnf $(cat packages.txt)
fi

