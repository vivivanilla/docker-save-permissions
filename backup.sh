#!/bin/bash

BACKUP_FILE=$1

echo -n "Backing-up permissions.. "

IFS_OLD=$IFS; IFS=$'\n'
for FILE in $(cd /target && tree -aif --noreport .)
do
   # Save the permissions of all the files in the index
   echo $FILE";"$(cd /target && stat -c "%a;%u;%g" $FILE) >> $BACKUP_FILE
done
IFS=$IFS_OLD

echo "done"

