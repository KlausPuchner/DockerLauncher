#!/bin/bash

# Turn off script exit on failure
set +e

clear
echo
echo -e "\e[1m Checking for Updates from Repo...\e[0m"

git pull --verbose git@github.com:KlausPuchner/DockerLauncher.git

echo " --- DONE!"
echo

echo " --- Starting Launcher..."
	/bin/bash ./app.sh
