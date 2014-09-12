LAMP
===

####HHVM - HACK - APACHE - PHP - MYSQL

This is a single server environment for testing Facebooks HHVM and Hack

```vagrant up```  
```vagrant ssh web```  

web   IP: 10.2.2.2  

Host port 1028 forwards to web port 80: 127.0.0.1:1028 -> web:80

#####Install Notes
######(Will be moved to Puppet modules)

Install LAMP
```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install apache2
sudo apt-get install mysql-server mysql-client
sudo apt-get install php5 php5-common php5-cli php5-mysql php5-cgi
```

Install <a href="https://github.com/facebook/hhvm/wiki/Prebuilt-packages-on-Ubuntu-14.04" target="_blank">HHVM</a>
```
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list
sudo apt-get update
sudo apt-get install hhvm
```