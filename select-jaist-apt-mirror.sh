if ! grep jaist.ac.jp /etc/apt/sources.list > /dev/null;then
    sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/ftp.jaist.ac.jp\/pub\/Linux\/ubuntu/' /etc/apt/sources.list
    apt-get update
fi
