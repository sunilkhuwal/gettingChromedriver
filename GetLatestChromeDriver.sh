#!/bin/bash

# Versions
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
chrome_driver_path="/c/chromedriver_win32/"
chrome_driver_old_versions_path="/c/chromedriver_win32/Old/"

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

#Getting existing driver version
existing_driver_version=`$chrome_driver_path"chromedriver.exe" -v|awk {'print $2'}`
echo $existing_driver_version

# Install ChromeDriver.
mv -f $chrome_driver_path"chromedriver.exe" $chrome_driver_old_versions_path"chromedriver_"$existing_driver_version".exe"
wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_win32.zip -P $chrome_driver_path/
unzip $chrome_driver_path"chromedriver_win32.zip" -d $chrome_driver_path
rm $chrome_driver_path/chromedriver_win32.zip
