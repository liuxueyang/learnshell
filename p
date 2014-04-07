#!/bin/bash - 
#===============================================================================
#
#          FILE: b.sh
# 
#         USAGE: ./b.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/07/14 12:20
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
git add --all
git commit -m 'add or delete'
git push origin master

