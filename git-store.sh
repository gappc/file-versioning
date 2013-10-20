#!/bin/bash

META_CMD=metastore
META_FILE=.git-metastore

#### test for meta storage ####
if ! hash $META_CMD 2>/dev/null
then
        echo "Meta storage \"$META_CMD\" not found"
        exit 1
fi

#### if no commit text is given, use std. text ####
COMMIT_MESSAGE="auto update"

if [[ $# -eq 1 ]]
then
	COMMIT_MESSAGE=$1
fi

#### first init git (commented out) ####
if ! test -d .git
then
	git init
fi

#### store metadata info (e.g. user, group, ...) ####
metastore -s -f $META_FILE

#### add all files to git ###
git add .
git commit -m "$COMMIT_MESSAGE"
