# This manifest configures a server specifically
package { 'nginx':
  ensure => 'present'
}

file { 'index.html':
  ensure  => 'present',
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

file_line { '301 redirection':
  path  => '/etc/nginx/sites-available/default',
  line  => '\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  after => 'var/www/html;'
}
