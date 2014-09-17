
class php::55 {
	
	exec { "apt-php":
	  command => "sudo apt-get install php5 php5-mysql php5-common php5-cli -y",
	  path    => ["/bin", "/usr/bin"],
	  timeout => 0
	}

}