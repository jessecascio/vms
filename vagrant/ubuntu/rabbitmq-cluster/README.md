RabbitMQ
===

####RabbitMQ Cluster

This is a RabbitMQ cluster with a master and a slave

```vagrant up```  
```vagrant ssh master```  
```vagrant ssh slave```

master IP: 10.2.2.2  
slave IP: 10.2.2.4 

Host port 1028 forwards to server port 15672: 127.0.0.1:1028 -> master:15672

Host port 1029 forwards to server port 5672: 127.0.0.1:1029 -> master:5672

