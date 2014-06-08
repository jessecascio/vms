
/**
 * Sets MySQL master conf file
 */

class mysql::master ($server_id=10)
{	

	file { "my.cnf":
		path    => "/etc/my.cnf",
		ensure  => file,
		require => [
		  Package["mysql"],
		  Package["mysql-server"]
		],
		content => template("mysql/master.erb")
	}
  
}
