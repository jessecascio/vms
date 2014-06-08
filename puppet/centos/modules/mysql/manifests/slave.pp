
/**
 * Sets MySQL slave conf file
 */

class mysql::slave ($server_id=20) {
  
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
    content => template("mysql/slave.erb")
  }
  
}
