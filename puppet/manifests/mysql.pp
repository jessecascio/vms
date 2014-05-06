
  # http://docs.puppetlabs.com/references/latest/type.html
  # 'mysql -uroot -e "DELETE FROM mysql.user WHERE User=\'\'; DELETE FROM mysql.user WHERE User=\'root\' AND Host NOT IN (\'localhost\', \'127.0.0.1\', \'::1\'); DROP DATABASE IF EXISTS test; FLUSH PRIVILEGES;"'
  
  exec { "yum-init":
    command => "yum -y update; yum -y install wget nano",
    path    => ["/bin", "/usr/bin"],
    timeout => 0
  }

  exec { "update-rpm":
    command => "wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm -O ~/mysql-server.rpm; rpm -ivh ~/mysql-server.rpm",
    path    => ["/bin", "/usr/bin"],
    require => Exec["yum-init"]
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