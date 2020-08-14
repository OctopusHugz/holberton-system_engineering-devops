# This manifest configures a server specifically
$command = "/usr/bin/env sed -i '14a add_header X-Served-By '${HOSTNAME}';' /etc/nginx/sites-available/default"

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
