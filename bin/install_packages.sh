#!/bin/sh

printf "Installing packages from packages.txt\n\n"



if $(which yay &> /dev/null) ; then
	printf "Using yay\n\n"
	yay -Sy

	yay -Sd $(cat packages.txt)

elif $(which pacman &> /dev/null) ; then
	printf "Using pacman \n\n"
	sudo pacman -Sy

	sudo pacman -S $(cat packages.txt)

elif $(which apt &> /dev/null) ; then
	printf "Using apt \n\n"
	sudo apt update
	sudo apt install $(cat packages.txt)

elif $(which dnf &> /dev/null) ; then
	printf "Using dnf \n\n"
	sudo dnf update
	sudo dnf $(cat packages.txt)
fi

