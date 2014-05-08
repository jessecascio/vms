
# http://webtatic.com/packages/php55/

class php::55 {
	
	exec { "update-rpm":
		command => "rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm",
	    path    => ["/bin", "/usr/bin"]
	}

	package { "php55w":       ensure => "present", require => Exec["update-rpm"] }
	package { "php55w-mysql": ensure => "present", require => Package["php55w"] }
	package { "php55w-pdo":   ensure => "present", require => Package["php55w"] }

}