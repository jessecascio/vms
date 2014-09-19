
class php::55 {
	
	exec { "apt-php":
	  command => "sudo apt-get install php5 php5-mysql php5-common php5-cli -y",
	  path    => ["/bin", "/usr/bin"],
	  timeout => 0
	}

	exec {"apt-composer":
		command => "curl -sS https://getcomposer.org/installer | php;mv composer.phar /usr/bin/composer;",
		require => Exec["apt-php"],
		path    => ["/bin", "/usr/bin"],
	  	timeout => 0
	}
}