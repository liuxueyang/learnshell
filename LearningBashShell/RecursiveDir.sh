#!/bin/bash - 
#===============================================================================
#
#          FILE: RecursiveDir.sh
# 
#         USAGE: ./RecursiveDir.sh 
# 
#   DESCRIPTION: This script can list the files and dirs 
# 								recursively in the current directory
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/02/2014 20:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# This function is recursive 
# It lists the files and directories in the current dir 
recdir()
{
	tab=$tab$singletab
# 	if [ ${#tab} -gt 4 ]
# 	then 
# 		return
# 	fi

	for file in "$@"
	do
		echo -en $tab$file
		# we get the path from original directory of the current file 
		# or directory
		thisfile=$thisfile/$file

		if [ -d "$thisfile" ]
		then 
			echo /
			# we force 'ls' to be a builtin command instead of some function 
			# or alias that we create by ourself
			recdir $(command ls $thisfile)
		else 
			echo
		fi

		# we must set thisfile to be the current directory
		thisfile=${thisfile%/*}
	done

	# we delete a tab when we get to the upper directory
	tab=${tab%"\t"}
}

# This function init
recls() 
{
	tab=""
	singletab="\t"
	for tryfile in "$@"
	do
		echo -n $tryfile
		if [ -d $tryfile ]
		then 
			echo /
			thisfile=$PWD$tryfile
			recdir $(command ls $tryfile)
		else 
			echo
		fi
	done

	# we unset these variables cause we do not use them 
	# By the way, in order not to overwrite system command 
	# in some other script it is better to do this.
	unset dir singletab tab
}

result=$(ls $1)
recls $result

exit 0

