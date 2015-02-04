apt-get purge -y nano
rm /etc/alternatives/editor
ln -s /usr/bin/vim /etc/alternatives/editor
