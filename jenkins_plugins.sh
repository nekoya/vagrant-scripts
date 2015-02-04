#
# install plugins
#
PLUGINS=$@
DIRTY=0
INSTALLED_PLUGINS_FILE=/tmp/jenkins_plugins.txt

echo "*** Install Jenkins plugins ***"
if [ "$1" == "" ];then
    echo "!!! specify plugin !!!" 1>&2
    exit 1
fi
java -jar jenkins-cli.jar -s http://localhost:8080 list-plugins > $INSTALLED_PLUGINS_FILE
for PLUGIN in $PLUGINS;do
    echo -n "checking Jenkins plugin [$PLUGIN] ... "
    if [ "`grep $PLUGIN $INSTALLED_PLUGINS_FILE`" == "" ];then
        echo "not installed. Start to intall"
        java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin $PLUGIN
        DIRTY=1
    else
        echo "already installed."
    fi
done
rm $INSTALLED_PLUGINS_FILE
if [ $DIRTY == 1 ];then
    echo "Restart Jenkins"
    java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart
fi
