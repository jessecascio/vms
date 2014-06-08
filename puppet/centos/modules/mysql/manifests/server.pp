
/**
 * Installs MySQL Server 5.6
 */

class mysql::server {

  exec { "update-rpm":
    command => "yum -y install wget; wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm -O ~/mysql-server.rpm; rpm -ivh ~/mysql-server.rpm",
    path    => ["/bin", "/usr/bin"]
  }
  
  package { "mysql": 
    ensure  => "present",
    require => Exec["update-rpm"]
  }

  package { "mysql-server": 
    ensure  => "present",
    require => Exec["update-rpm"]
  }

  service {"mysqld":
    enable  => true,
    ensure  => running,
    require => [
      Package["mysql"],
      Package["mysql-server"]
    ]
  }
  
}
