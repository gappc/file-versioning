#!/bin/bash

META_CMD=metastore
META_FILE=.git-metastore

#### test for meta storage ####
if ! hash $META_CMD 2>/dev/null
then
	echo "Meta storage \"$META_CMD\" not found"
	exit 1
fi

#### test for git repository ####
if ! test -d .git
then
        echo "No git repository found"
	exit 1
fi

#### checkout current branch ####
if [[ $EUID -ne 0 ]]
then
	echo "The script must be run as root" 1>&2
	exit 1
else
	git checkout .
	metastore -a -e -f $META_FILE
fi
