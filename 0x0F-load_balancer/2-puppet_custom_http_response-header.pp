# This manifest configures a server specifically
$update = "/usr/bin/env apt-get -y update"
$command = "/usr/bin/env sed -i '38a add_header X-Served-By $hostname;' /etc/nginx/sites-available/default"

exec { 'apt-get update':
  command => $update,
  before  => Package['nginx']
}

package { 'nginx':
  ensure   => 'installed',
  provider => 'apt'
}

file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

exec { 'custom HTTP header':
  command => $command
}

service { 'nginx':
  ensure  => 'running',
  restart => 'sudo service nginx restart'
}
