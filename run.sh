#!/bin/bash

./backup.sh /permissions.backup

if [ -f "/permissions" ]; then
    ./restore.sh /permissions
fi

trap ./exit.sh TERM

tail -f /dev/null & wait

exit 0

