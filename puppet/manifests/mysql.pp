
  # http://docs.puppetlabs.com/references/latest/type.html
  # http://matthewturland.com/2012/02/13/setting-up-ec2-for-drupal-with-puppet/
  # yum -y update

  exec { "yum-init":
    command => "yum -y install wget nano",
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