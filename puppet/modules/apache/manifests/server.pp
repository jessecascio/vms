

class apache::server {

  package { "httpd": 
    ensure  => "present"
  }

  service {"httpd":
    enable  => true,
    ensure  => running,
    require => Package["httpd"]
  }
  
}
