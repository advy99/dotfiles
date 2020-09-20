#!/bin/sh

printf "Deploying dotfiles to the system:\n\n"

printf "This action will override your actual dotfiles, are you sure?[y/n]: "
read answer

while [ "$answer" != "n" ] && [ "$answer" != "y" ]; do
	printf "You need to answer 'y' or 'n': "
	read answer
done


if [ "$answer" = "n" ]; then
	printf "\nExiting without touching anything\n"
	exit 1
fi

for line in $(cat tracked_files.txt)
do

	# if is located in local folder
	if [[ $line == \~/* ]]; then
		# the name in the repo is the same except for the ~/
		local_line=${line:2}
		line=$HOME/$local_line
	else
		# else we use the basename
		local_line=$(basename $line)
	fi

	if [ -f $line ]; then
		printf "\tDeploying file ../$local_line in $line\n"
		# copy to the repo
		cp ../$local_line $line
	elif [ -d $line ]; then
		printf "\tDeploying directory ../$local_line in $line\n"
		# copy with -R
		cp -R ../$local_line/* $line
	else
		printf "\tSkipping $line, is not a file or a directory.\n"
	fi

done

printf "\nAll tracked dotfiles deployed.\n"


