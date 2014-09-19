
class hhvm::server {

	exec { "apt-hhvm":
		command => "wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -;
					echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list;
					sudo apt-get update;
					sudo apt-get install hhvm -y;
					sudo /usr/share/hhvm/install_fastcgi.sh;",
		path    => ["/bin", "/usr/bin"],
		require => [
			Exec["apt-apache"],
			Exec["apt-php"]
		],
		timeout => 0
	}
  
}
