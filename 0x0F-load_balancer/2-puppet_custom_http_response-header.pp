# This manifest configures a server specifically
$update = '/usr/bin/env apt-get -y update'
$command = "/usr/bin/env sed -i '14a add_header X-Served-By ${hostname};' /etc/nginx/nginx.conf"

exec { 'apt-get update':
  command => $update
}

-> package { 'nginx':
  ensure   => 'installed',
  provider => 'apt'
}

-> exec { 'custom HTTP header':
  command => $command
}

-> file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}
-> service { 'nginx':
  ensure  => 'running',
  restart => 'sudo service nginx restart'
}
