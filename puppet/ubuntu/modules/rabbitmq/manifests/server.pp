
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
					sudo rabbitmqctl add_user jesse pass; 
					sudo rabbitmqctl set_user_tags jesse administrator; 
					sudo rabbitmqctl set_permissions -p / jesse '.*' '.*' '.*';",
		path    => ["/bin", "/usr/bin"],
		timeout => 0
	}
}
