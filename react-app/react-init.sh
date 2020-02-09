#!/usr/bin/env bash

echo "START INIT SCRIPT"

git clone https://github.com/Przemocny/react-redux-wordpress-theme.git ./app
cd app
echo "THEME FROM REPO DONE"

yarn
echo "PACKAGES DONE"

yarn build
echo "BUILD DONE"

# yarn add serve
serve -s build