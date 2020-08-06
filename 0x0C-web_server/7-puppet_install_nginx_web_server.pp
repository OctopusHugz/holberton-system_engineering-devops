# This manifest configures a server specifically
$line = "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;"

package { 'stdlib':
  ensure => 'installed',
  source => 'https://forge.puppet.com/v3/files/puppetlabs-stdlib-6.3.0.tar.gz'
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

file_line { '301 redirection':
  path  => '/etc/nginx/sites-available/default',
  line  => $line,
  after => '/var/www/html;'
}

service { 'nginx':
  ensure  => 'running',
  restart => 'sudo service nginx restart'
}
