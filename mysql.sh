#
# MySQL
#
PASSWD=${1:-"''"}
if [ ! -f /usr/sbin/mysqld ];then
    echo "*** Install MySQL ***"

    # install
    echo "mysql-server-5.5 mysql-server/root_password password $PASSWD" | debconf-set-selections
    echo "mysql-server-5.5 mysql-server/root_password_again password $PASSWD" | debconf-set-selections
    apt-get install -y mysql-server-5.5 libmysqlclient-dev

    # root .my.cnf
    cat <<EOF > /root/.my.cnf
[client]
password = $PASSWD
EOF

    # apply config
    service mysql restart

    # create operation account
    mysql -e 'grant create, select, insert, update, delete, alter, drop, index, lock tables, process, show databases, replication client on *.* to admin identified by "$PASSWD"'
fi
