
class apt::update {

  exec { "apt-init":
    command => "sudo apt-get update -y;sudo apt-get upgrade -y;sudo apt-get install git -y;",
    path    => ["/bin", "/usr/bin"],
    timeout => 0
  }
  
}
