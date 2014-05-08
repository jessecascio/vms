
# Research define / templates
# https://github.com/averna-syd/puppet-ssh

class ssh::server {

  package { "openssh-server": 
    ensure  => "present"
  }

  service {"sshd":
    enable  => true,
    ensure  => running,
    require => Package["openssh-server"]
  }
  
}
