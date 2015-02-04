#
# install packages by apt-get
#
PACKAGES=$@
if [ "$1" == "" ];then
    echo "!!! specify package(s) !!!" 1>&2
    exit 1
fi
for PACKAGE in $PACKAGES;do
    if ! dpkg -l $PACKAGE > /dev/null; then
        echo "*** Install $PACKAGE ***"
        apt-get install -y $PACKAGE
    fi
done
