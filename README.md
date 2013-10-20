versioning-files
================

Short script for versioning full directories + subdirectories in linux, using git. Stores also file metadata (like fileowner, permissions, ...) and empty directories.

Prerequisite are git and metastore (git://git.hardeman.nu/metastore.git)

Installation
------------

- Install git. Ubuntu: sudo apt-get install git
- Install metastore. Ubuntu: sudo apt-get install metastore. If you don't use Ubuntu, look for packages that fit your system or build metastore from source
- Copy the provided script files to your system
- Recommended: add the directory, where the scripts are located, to your PATH

Usage
-----
<strong>git-store.sh [commit-message]</strong>

Adds files and folders of current directory to git repository located in current directory
- If there is no git folder, one is created
- All metadata is gathered and stored in file .git-metastore
- Files are added and commited to git repository using [commit-message] if provided or "auto update" as message

<strong>git-unstore.sh</strong>

Must be run as root, because it is possible that files should be restored, that belong to root. If this command wouldn't be run as root, some metadata may not be restored correctly.
