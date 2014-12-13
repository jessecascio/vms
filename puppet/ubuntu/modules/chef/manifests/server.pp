
class chef::server {

	exec { "apt-chef-server":
		command => "sudo hostname chefserver.cluster.com;
		echo "chefserver.cluster.com" | sudo tee /etc/hostname;
		echo -e "127.0.0.2 `hostname` `hostname -s`" | sudo tee -a /etc/hosts;
		sudo wget -O /home/vagrant/chef-server-core.deb https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.0-1_amd64.deb;
		sudo dpkg -i /home/vagrant/chef-server-core.deb;
		sudo chef-server-ctl reconfigure;",
		path    => ["/bin", "/usr/bin"],
		timeout => 0
	}
  
}
