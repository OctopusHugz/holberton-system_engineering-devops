# This manifest configures a server specifically
$command = "/usr/bin/env sed -i '36a rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default"

package { 'nginx':
  ensure   => 'installed',
  provider => 'apt'
}

file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

exec { '301 redirect':
  command => $command
}

service { 'nginx':
  ensure  => 'running',
  restart => 'sudo service nginx restart'
}
