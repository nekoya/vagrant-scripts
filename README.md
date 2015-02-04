# Vagrant provisioning scripts

## ag.sh

Install ag (The Silver Searcher) on Ubuntu 12.04 lts.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/select-jaist-apt-mirror.sh"
```

## apt-get.sh

Install package(s) through `apt-get install`.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/apt-get.sh", :args => ["git"]
```

## jenkins.sh

Install Jenkins. Require to import `openjdk.sh` in advance.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/openjdk.sh"
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/jenkins.sh"
```

## jenkins-plugins.sh

Install Jenkins plugin(s). Require to import `jenkins.sh` in advance.

```
config.vm.provision :shell,
  :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/jenkins-plugins.sh",
  :args => ["cobertura", "git", "ghprb", "slack", "emotional-jenkins-plugin"]
```

## mysql.sh

Install MySQL.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/mysql.sh"
```

You can specify root password through `args`.

```
config.vm.provision :shell,
  :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/mysql.sh"
  :args => "your password"
```

## nginx.sh

Install nginx from official mainline apt repository.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/nginx.sh"
```

## openjdk.sh

Install OracleJDK7.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/openjdk.sh"
```

## purge-nano.sh

Set vim as default editor and purge `nano`.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/purge-nano.sh"
```

## select-jaist-apt-mirror.sh

Select APT mirror `jaist.ac.jp`.

```
config.vm.provision :shell, :path => "https://raw.githubusercontent.com/nekoya/vagrant-scripts/master/select-jaist-apt-mirror.sh"
```
