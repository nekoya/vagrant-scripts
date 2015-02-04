#
# nginx
#
if ! dpkg -l | grep nginx >/dev/null;then
    echo "deb http://nginx.org/packages/mainline/ubuntu/ precise nginx" > /etc/apt/sources.list.d/nginx.list
    curl -L http://nginx.org/keys/nginx_signing.key | apt-key add -
    apt-get -y update
    apt-get install -y nginx
fi
