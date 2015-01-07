
class rabbitmq::cluster {
	
	file { "rabbitmq.config":
		path    => "/etc/rabbitmq/rabbitmq.config",
		ensure  => file,
		content => template("rabbitmq/cluster.erb"),
		require => Exec["apt-rabbitmq"]
	}

	exec { "rabbitmq-cluster":
		command => "sudo service rabbitmq-server stop;
					sudo rm /var/lib/rabbitmq/.erlang.cookie;
					echo 'jesse54ac1be08ea64' | sudo tee -a /var/lib/rabbitmq/.erlang.cookie;
					sudo chmod 400 /var/lib/rabbitmq/.erlang.cookie;
					sudo chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie;
					echo '10.2.2.2 rabbit-master' | sudo tee -a /etc/hosts;
					echo '10.2.2.4 rabbit-slave' | sudo tee -a /etc/hosts;
					sudo service rabbitmq-server start;
					sudo rabbitmqctl stop_app;
					sudo rabbitmqctl reset;
					sudo rabbitmqctl start_app;",
		require => [
			Exec["apt-rabbitmq"],
			File["rabbitmq.config"]
		],
		path    => ["/bin", "/usr/bin"],
		timeout => 0
	}
}
