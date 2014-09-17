
/**
 * Installs MySQL Server 5.6
 */

class mysql::server {
  
  package { "mysql-client": 
    ensure  => "present"
  }

  package { "mysql-server": 
    ensure  => "present"
  }

  service {"mysql":
    enable  => true,
    ensure  => running,
    require => [
      Package["mysql"],
      Package["mysql-server"]
    ]
  }
  
}
