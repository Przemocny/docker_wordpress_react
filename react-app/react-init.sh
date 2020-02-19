#!/usr/bin/env bash
echo "START INIT SCRIPT"

git clone https://github.com/Przemocny/react-redux-wordpress-theme.git ./app
cd app
echo "THEME FROM REPO DONE"

yarn
echo "PACKAGES DONE"

# to run dev version
yarn start

# to run prod version
# yarn deploy
