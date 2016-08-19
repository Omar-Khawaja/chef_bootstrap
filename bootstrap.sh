#!/bin/bash

# Specify your file below

file=<your filename goes here>
status=0

printf "\nWelcome to 'BOOTSTRAP NODES'\n\n"
printf "Looking for a file named $file in the present working directory...\n"
sleep 3
if [ ! -f $file ]; then
	printf "\nError: $file not found in present working directory.\n\n"
	printf "Goodbye\n\n"
	exit 1
fi

printf "\nFound file $file in the present working directory.\n\n"

printf "\nPreparing to bootstrap the following nodes to Chef server:\n"
sleep 1
while read line; do
	printf "$line\n"
done < $file

printf "\nDeleting any deprecated client/nodes on Chef server:\n"
printf "\nIt is normal to see errors at this point\n"
sleep 1
while read line; do
	yes | knife node delete $line
	yes | knife client delete $line
done < $file
sleep 3

# You will need to insert your cookbook name below
# (where it says \"<insert your cookbook name>\"

printf "\n\nBootstrapping nodes...\n\n"
while read line; do
	knife bootstrap $line --ssh-user root --identity-file ~/.ssh/id_rsa --node-name $line --run-list 'recipe[<insert your cookbook name>]'
	status=$?
	if [ $status -ne 0 ]; then
		arr_fails[slot]=$line
		((slot++))
	fi
done < $file

if [ ${#arr_fails[@]} -gt 0 ]; then
	printf "\n\nError: could not bootstrap the following nodes "
	printf "to chef server\n"
	for i in ${arr_fails[@]}; do
		printf "$i\n"
	done
fi

printf "\n'BOOTSTRAP NODES' FINISHED\n\nGoodbye\n\n"
