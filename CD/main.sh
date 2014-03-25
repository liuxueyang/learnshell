#!/bin/bash - 
#===============================================================================
#
#          FILE: main.sh
# 
#         USAGE: ./main.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/14 15:30
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

menu_choice=""
current_cd=""
title_file="title.cdb"
tracks_file="tracks.cdb"
tmp_file=.tmp_cdb.$$
trap 'rm -f $tmp_file' EXIT 

get_return() 
{
	echo -n "Press return "
	read x
	return 0
}

get_confirm()
{
	echo -n "Are you sure? "
	while:
	do
		read x
		case "$x" in 
			[yY] | [yY][eE][sS] ) 
				return 0
				;;
			[nN] | [nN][oO] )
				echo
				echo "Cancelled"
				return 1
				;;
			* )
				echo "Please enter yes or no"
				;;
		esac
	done
}

set_menu_choice()
{
	clear
	echo "Options :-"
	echo
	echo " 	a) Add new CD"
	echo " 	f) Find CD"
	echo " 	c) Count the CDs and tracks in the catalog"

	if [ "$cdcatnum" != "" ]; then
		echo " 	l) List tracks on $cdtitle"
		echo " 	r) Remove $cdtitle"
		echo " 	u) Update track information for $cdtitle"
	fi

	echo " 	q) Quit"
	echo
	echo -n "Please enter choice then press return "
	read menu_choice
	return
}

insert_title()
{
	echo $* >> $title_file
	return
}

insert_track()
{
	echo $* >> $tracks_file
	return
}

add_record_tracks()
{
	echo "Enter track information for this CD"
	echo "When no more tracks enter q"
	cdtrack=1
	cdtitle=""
	while [ "$cdtitle" != "q" ]
	do
		echo -n "Track $cdtrack, track title? "
		read tmp 
		cdtitle=${tmp%%,*}
		if [ "$tmp" != "$cdtitle" ]; then
			echo "Sorry, no commas allowed"
			continue
		fi
		if [ -n "$cdtitle" ]; then
		fi

	done
}
