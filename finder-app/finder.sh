#
# Write a shell script finder-app/finder.sh as described below:
#
# - Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, 
#    referred to below as filesdir; the second argument is a text string which will be searched within these 
#    files, referred to below as searchstr
# - Exits with return value 1 error and print statements if any of the parameters above were not specified
# - Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
# - Prints a message "The number of files are X and the number of matching lines are Y" where X is the number 
#    of files in the directory and all subdirectories and Y is the number of matching lines found in respective
#    files, where a matching line refers to a line which contains searchstr (and may also contain additional content).
# 
# Example invocation:
#       finder.sh /tmp/aesd/assignment1 linux

#!/bin/sh

# Assign the parameters to variables
filesdir=$1
textString=$2

# Check if the number of parameters passed is less than 2 or greater than 2
if [ $# -lt 2 ] || [ $# -gt 2 ]
then
	echo "Wrong number of parameters passed. Expected 2 parameters, received $# parameter(s)"
	exit 1
fi

# Check if the first parameter is empty
if [ -z "$filesdir" ]
then
	echo "The first parameter is empty"
	exit 1
fi
# Check if the second parameter is empty
if [ -z "$textString" ]
then
	echo "The second parameter is empty"
	exit 1
fi

# Check if filesdir does not represent a directory on the filesystem
if [ ! -d "$filesdir" ]
then
	echo ""$filesdir" is not a directory on the filesystem"
	exit 1
fi

# Count the number of files in filesdir and all subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines in respective files
num_matching_lines=$(grep -r "$textString" "$filesdir" | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

# Exit with value 0
exit 0
