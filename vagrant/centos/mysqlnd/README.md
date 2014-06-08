PHP Mysqlnd Replication Library
===

####Web - Master - Slave1 - Slave2 - Slave3

The purpose of this cluster is to test PHP's mysqlnd replication library for load balancing a PHP application across a distributed MySQL architecture.  The cluster includes an application server with Apache and PHP, a MySQL master server and two MySQL slaves.

#####Setup

A slave user must be created on the master server VM:

```mysql -u root -e "CREATE USER 'slave'@'10.2.2.%' IDENTIFIED BY '';GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'slave'@'10.2.2.%';FLUSH PRIVILEGES;"```

The master server's MySQL bin log info must be determined:
```
SHOW MASTER STATUS \G

File: master-bin.000003
Position: 120
```

The slaves must be connected to the master:
```
CHANGE MASTER TO
MASTER_HOST = '10.2.2.4',
MASTER_USER = 'slave',
MASTER_PASSWORD = '',
MASTER_LOG_FILE = 'master-bin.000003',
MASTER_LOG_POS = 120;
```

The slaves must be started
```
START SLAVE;
SHOW SLAVE STATUS \G
```

#####Notes

```vagrant up```  
```vagrant ssh web```  
```vagrant ssh master```  
```vagrant ssh slave1```  
```vagrant ssh slave2``` 

web IP: 10.2.2.2  
slave1 IP: 10.2.2.4
slave1 IP: 10.2.2.6
slave2 IP: 10.2.2.8

Host port 8888 forwards to web port 80: 127.0.0.1:8888 -> web:80
Host port 1028 forwards to master port 3306: 127.0.0.1:1028 -> master:3306

You can access master VM via a MySQL GUI on local computer by connecting via 127.0.0.1:1028.  To create a user to connect with, run the following on the master VM:
```
mysql -u root -e "CREATE USER 'host'@'%' IDENTIFIED BY '';GRANT ALL ON *.* TO 'host'@'%';FLUSH PRIVILEGES;"
```

