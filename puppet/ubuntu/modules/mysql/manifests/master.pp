
/**
 * Sets MySQL master conf file
 */

class mysql::master ($server_id=10)
{	

	file { "/var/log/mysql":
	    ensure => "directory",
	    owner  => "mysql",
	    group  => "mysql",
		mode   => 755
	}

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
