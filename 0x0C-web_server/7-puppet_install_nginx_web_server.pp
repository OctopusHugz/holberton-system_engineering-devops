# This manifest configures a server specifically
package { 'apache2.2-common':
    ensure => 'absent',
}

package { 'nginx':
  ensure   => 'installed',
  provider => 'apt',
  require => Package['apache2.2-common']
}


service { 'nginx':
  ensure  => 'running',
  require => Package['nginx']
}

file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

file_line { '301 redirection':
  path  => '/etc/nginx/sites-available/default',
  line  => '    rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  after => '/var/www/html;'
}
