
class rabbitmq::server {

	exec { "apt-rabbitmq":
		command => "sudo apt-get install erlang -y;
					sudo apt-get install erlang-nox -y;
					echo deb http://www.rabbitmq.com/debian/ testing main | sudo tee /etc/apt/sources.list;
					wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc;
					sudo apt-key add rabbitmq-signing-key-public.asc;
					sudo apt-get update;
					sudo apt-get install rabbitmq-server -y;
					sudo rabbitmq-plugins enable rabbitmq_management;
					sudo service rabbitmq-server start;",
		path    => ["/bin", "/usr/bin"],
		timeout => 0
	}

	file { "rabbitmq.config":
	    path    => "/etc/rabbitmq/rabbitmq.config",
	    ensure  => file,
	    require => [
	      Package["rabbitmq-server"]
	    ],
	    content => template("rabbitmq/cluster.erb")
	}
}
