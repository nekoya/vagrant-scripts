#
# Jenkins
#
if ! dpkg -l | grep jenkins >/dev/null;then
    echo "*** Install Jenkins ***"

    # install
    curl -L http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
    apt-get -y update
    apt-get install -y jenkins

    # wait jenkins http port
    echo "wait Jenkins service "
    while [ "`netstat -tunl|grep 8080`" = "" ];do echo -n "."; sleep 2; done
    echo " ok"

    # download jenkins-cli
    echo -n "downloading jenkins-cli.jar "
    while [ ! -f jenkins-cli.jar ]; do
        echo -n "."
        sleep 2
        wget -q http://localhost:8080/jnlpJars/jenkins-cli.jar
    done
    echo " ok"

    # update center
    curl -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H "Accept: application/json" -d @- http://localhost:8080/updateCenter/byId/default/postBack
fi
