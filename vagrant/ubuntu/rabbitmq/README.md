LAMP
===

####RabbitMQ

This is a RabbitMQ cluster with a server 

```vagrant up```  
```vagrant ssh server```  

Web IP: 10.2.2.2  

Host port 1028 forwards to server port 15672: 127.0.0.1:1028 -> server:15672
Host port 1029 forwards to server port 5672: 127.0.0.1:1028 -> server:5672

