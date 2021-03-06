MySQL Slave(s)
===

####Master - Slave

This is a multi-server MySQL slave cluster.  Add as many slaves as needed via Vagrantfile

```vagrant up```  
```vagrant ssh master```  
```vagrant ssh slave1```  

master IP: 10.2.2.2  
slave1 IP: 10.2.2.4

Host port 1028 forwards to master port 3306: 127.0.0.1:1028 -> master:3306

You can access master VM via a MySQL GUI on host computer by connecting via 127.0.0.1:1028.  To create a user to connect with, run the following on the master VM:
```
mysql -u root  

CREATE USER 'host'@'%' IDENTIFIED BY '';
GRANT ALL ON *.* TO 'host'@'%';
FLUSH PRIVILEGES;
```
