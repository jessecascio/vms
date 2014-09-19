
class apache::server {

	exec { "apt-apache":
		command => "sudo apt-get install apache2 -y",
		path    => ["/bin", "/usr/bin"],
		timeout => 0
	}
 
	file { "/var/www":
	    ensure => "directory",
	    owner  => "vagrant",
	    group  => "vagrant",
	    mode   => 644,
	    recurse => true,
	    require => Exec["apt-apache"]
	}
}
