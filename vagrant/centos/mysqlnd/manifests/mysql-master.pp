
############################################################################                  
#####################           MySQL Modules         #####################
############################################################################ 

include mysql::server

# master config
class { "mysql::master":
			server_id => 5	
	  }