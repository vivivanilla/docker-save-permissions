#!/bin/bash

BACKUP_FILE=$1

echo -n "Restoring permissions.. "

IFS_OLD=$IFS; IFS=$'\n'
while read -r LINE || [[ -n "$LINE" ]];
do
   ITEM=$(echo $LINE | sed 's/^.\(.*\);[0-9]*;[0-9]*;[0-9]*$/\/target\1/g')
   PERMISSIONS=$(echo $LINE |sed 's/^.*;\([0-9]*\);[0-9]*;[0-9]*$/\1/g')
   USER=$(echo $LINE | sed 's/^.*;[0-9]*;\([0-9]*\);[0-9]*$/\1/g')
   GROUP=$(echo $LINE | sed 's/^.*;[0-9]*;[0-9]*;\([0-9]*\)$/\1/g')

   chmod $PERMISSIONS $ITEM && chown $USER:$GROUP $ITEM
done < $BACKUP_FILE
IFS=$IFS_OLD

echo "done"

exit 0

