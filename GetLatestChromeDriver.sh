#!/bin/bash

	############################################################################
	#	Developer: Sunil Kumar                                                 #
	#	Version: 1.0                                                           #
	#	Date: 20-Sept-2017                                                     #
	#	Tool Required to Execute the script: Git bash                          #
	#	Command to Execute on Git Bash: bash -x GetLatestChromeDriver.sh       #
	#	OS: Windows(Tested)                                                    #
	############################################################################

# Versions
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
chrome_driver_path="/c/chromedriver_win32/"                   #Set the home path of driver
chrome_driver_old_versions_path=$chrome_driver_path"Old/"
existing_driver_version=nill

install_latest_driver()
{
	echo "Installing Latest driver"
	wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_win32.zip -P $chrome_driver_path
	unzip $chrome_driver_path"chromedriver_win32.zip" -d $chrome_driver_path
	rm $chrome_driver_path/chromedriver_win32.zip
	echo "Chromedriver: "$CHROME_DRIVER_VERSION
}

#Checking if the folder is present or not
if [ ! -d $chrome_driver_path ]; then
{
	mkdir $chrome_driver_path
}
fi
if [ ! -d $chrome_driver_old_versions_path ]; then
{
	mkdir $chrome_driver_old_versions_path
}
fi

if [ ! -f $chrome_driver_path"chromedriver.exe" ]; then
{
	echo "Driver is not present!"
	install_latest_driver
}
else
{
	#Getting existing driver version
	existing_driver_version=`$chrome_driver_path"chromedriver.exe" -v|awk {'print $2'}`

	if [ $CHROME_DRIVER_VERSION == `cut -d'.' -f1,2 <<< $existing_driver_version` ]; then #Verifying the existing driver with the latest driver on website
	{
		echo "Driver is up to date. No need to update it."
	}
	else
	{
		# Install ChromeDriver.
		mv -f $chrome_driver_path"chromedriver.exe" $chrome_driver_old_versions_path"chromedriver_"$existing_driver_version".exe"
		install_latest_driver
	}
	fi
}
fi

