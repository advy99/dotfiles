#!/bin/sh

printf "Pulling dotfiles from the system to this repo:\n\n"

# for all files in tracked_files
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
		printf "\tPulling file $line in ../$local_line\n"
		# copy to the repo
		cp $line ../$local_line
	elif [ -d $line ]; then
		printf "\tPulling directory $line in ../$local_line\n"
		# copy with -R
		cp -R $line/* ../$local_line
	else
		printf "\tSkipping $line, is not a file or a directory.\n"
	fi

done

printf "\nAll tracked dotfiles pulled.\n"
