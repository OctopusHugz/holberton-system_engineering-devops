# This manifest configures a server specifically
# $redirect = "/usr/bin/env sed -i '36a rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default"
$install = '/usr/bin/puppet puppet module install puppetlabs-stdlib -i /etc/modules/puppet'
$line = "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;"

package { 'nginx':
  ensure   => 'installed',
  provider => 'apt'
}

file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

exec { 'stdlib install':
  command => $install
}

file_line { '301 redirection':
  path  => '/etc/nginx/sites-available/default',
  line  => $line,
  after => '/var/www/html;'
}

service { 'nginx':
  ensure  => 'running',
  restart => 'sudo service nginx restart'
}
