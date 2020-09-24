#!/bin/sh

printf "Pulling dotfiles from the system to this repo:\n\n"

printf "This action will override your dotfiles in this repo, are you sure?[y/n]: "
read answer

while [ "$answer" != "n" ] && [ "$answer" != "y" ]; do
	printf "You need to answer 'y' or 'n': "
	read answer
done


if [ "$answer" = "n" ]; then
	printf "\nExiting without touching anything\n"
	exit 1
fi

printf "\n"

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

	if [ -f ../$local_line ]; then
		diff -r $line ../$local_line > /dev/null
	else
		printf "$line does not exists in the repo.\n"
	fi


	if [ $? -eq 0 ]; then
		printf "\t $line didn't changed since last pull. Omitting.\n"
	else

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
	fi

done

printf "\nAll tracked dotfiles pulled.\n"
