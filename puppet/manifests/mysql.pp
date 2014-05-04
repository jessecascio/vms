  exec { "yum-init":
    command => "yum -y update; yum -y install wget nano",
    path    => ['/usr/bin']
  }

  exec { "get-rpm":
    command => "wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm -O ~/mysql-server.rpm",
    path    => ['/usr/bin'],
    require => Exec['yum-init']
  }

  exec { "update-rpm":
    command => "rpm -ivh ~/mysql-server.rpm",
    path    => ['/bin'],
    require => Exec['get-rpm']
  }
  
  # move this to a Package
  exec { "mysql-install":
    command => "yum -y install mysql mysql-server",
    path    => ['/usr/bin'],
    require => Exec['update-rpm']
  }

  service {"mysqld":
    enable  => true,
    ensure  => running,
    require => Exec['mysql-install']
  }

