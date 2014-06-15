PHP Mysqlnd Replication Library
===

####Web - Master - Slave1 - Slave2

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

NOTE: After the initial set up, only the START SLAVE command will need to be run on additional VM startups.  Alternatively you can enable auto start for slaves:
```
sudo vi /etc/my.cnf
skip-slave-start = false
```

All of the database servers need to be accessible from the web server.  Add a web user to master, which will be replicated to slaves:
```
mysql -u root -e "CREATE USER 'web'@'%' IDENTIFIED BY '';GRANT ALL ON *.* TO 'web'@'%';FLUSH PRIVILEGES;"
```

NOTE: If you have issues connecting to slaves from web server you may need to drop user and recreate on slave servers instead of relying on replication:
```
DROP USER web;
```

For test data, you can use <a href="http://dev.mysql.com/doc/index-other.htm" target="_blank">MySQL's test databases</a>.  Download the sql and import into master  via the host machine.  The changes will be replicated to the slaves:
```
mysql -u host -h 127.0.0.1 -P 1028 < world_innodb.sql
```

More info on <a href="http://jessesnet.com/development-notes/2014/mysql-master-slave-replication/" target="_blank">MySQL Replication</a>

#####Notes

```vagrant up```  
```vagrant ssh web```  
```vagrant ssh master```  
```vagrant ssh slave1```  
```vagrant ssh slave2``` 

web IP: 10.2.2.2  
master IP: 10.2.2.4
slave1 IP: 10.2.2.6
slave2 IP: 10.2.2.8

Host port 8888 forwards to web port 80: 127.0.0.1:8888 -> web:80
Host port 1028 forwards to master port 3306: 127.0.0.1:1028 -> master:3306
Host folder src/ is synced to web: /var/www/html

You can access master VM via a MySQL GUI on local computer by connecting via 127.0.0.1:1028.  To create a user to connect with, run the following on the master VM:
```
mysql -u root -e "CREATE USER 'host'@'%' IDENTIFIED BY '';GRANT ALL ON *.* TO 'host'@'%';FLUSH PRIVILEGES;"
```

