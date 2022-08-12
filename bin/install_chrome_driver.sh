#!/bin/bash
# chrome driver

pushd /tmp
sudo apt-get install -y unzip
version=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE")
echo $version
wget -qP ./ "https://chromedriver.storage.googleapis.com/${version}/chromedriver_linux64.zip"
sudo unzip -o chromedriver_linux64.zip -d /usr/local/bin
popd
