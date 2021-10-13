#! /bin/bash

# 0. Stop apache service
sudo service apache2 graceful-stop

# 1. Setup environment variables from .env file
set -o allexport
source .env
set +o allexport

# 2. Copy/override config files (apache, php) to their destination
cp ./$SRC_APACHE_CONF $DEST_APACHE_CONF
cp ./$SRC_PHP_INI $DEST_PHP_INI

# 3. Source code : remove current files at destination, then copy from ./src/public to destination
rm -vrf $DEST_APACHE_PUBLIC_DIR
cp ./src/public $DEST_APACHE_PUBLIC_DIR

# 4. Start apache service
sudo service apache2 start