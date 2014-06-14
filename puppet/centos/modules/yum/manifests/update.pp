
class yum::update {

  exec { "yum-init":
    command => "yum -y update; yum -y install nano",
    path    => ["/bin", "/usr/bin"],
    timeout => 0
  }
  
}
