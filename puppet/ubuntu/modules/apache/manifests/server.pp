
class apache::server {

  exec { "apt-apache":
	  command => "sudo apt-get install apache2 -y",
	  path    => ["/bin", "/usr/bin"],
	  timeout => 0
	}
  
}
