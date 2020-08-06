# This manifest configures a server specifically
package { 'nginx':
  ensure   => 'installed',
  provider => 'apt'
}

service { 'nginx':
  ensure  => 'running'
}

file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

file_line { '301 redirection':
  path  => '/etc/nginx/sites-available/default',
  line  => '    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=F0ddL6VaAVs;
        }',
  after => 'server_name _;'
}
