#
# OracleJDK7
#
if [ ! -f /usr/bin/java ];then
    cat <<EOF > /etc/apt/sources.list.d/webupd8team-java-precise.list
deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main
deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main
EOF

    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
    apt-get update

    echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
    apt-get install -y oracle-java7-installer
fi
