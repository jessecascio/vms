
class yum::update {

  exec { "yum-init":
    command => "yum -y update",
    path    => ["/bin", "/usr/bin"],
    timeout => 0
  }
  
}
