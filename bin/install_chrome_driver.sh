#!/bin/bash +x
# chrome driver

pushd /tmp
sudo apt-get install -y unzip
version=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE")
echo $version
filename="chromedriver_linux64.zip"
url="https://chromedriver.storage.googleapis.com/${version}/$filename"
echo $url
[[ -f $filename ]]; rm -f $filename
wget -P ./ $url
sudo unzip -o $filename -d /usr/local/bin
chromedriver -version
popd
