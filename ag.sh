#
# ag (The Silver Searcher) on Ubuntu12.04
#
if [ ! -f /usr/local/bin/ag ];then
    echo "*** install ag (The Silver Searcher) ***"
    apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
    git clone https://github.com/ggreer/the_silver_searcher.git
    cd the_silver_searcher
    ./build.sh
    make install
    cd ..
    rm -rf the_silver_searcher
fi
