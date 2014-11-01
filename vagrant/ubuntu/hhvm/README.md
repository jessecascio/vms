LAMP
===

####HHVM - HACK - APACHE - PHP

This is a single server environment for testing Facebooks HHVM and Hack

```vagrant up```  
```vagrant ssh web```  

Web IP: 10.2.2.2  

Host port 1028 forwards to web port 80: 127.0.0.1:1028 -> web:80

Synced Folder: <br>
	Local:   shared/ 
	Vagrant: /var/shared
