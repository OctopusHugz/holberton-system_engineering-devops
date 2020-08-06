# This manifest configures a server specifically
#$line = "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;"
$command = "sed -i '36a \trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default"

package { 'nginx':
  ensure   => 'installed',
  provider => 'apt'
}

file { 'index.html':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => 'Holberton School is cool'
}

#file_line { '301 redirection':
#  path  => '/etc/nginx/sites-available/default',
#  line  => $line,
#  after => '/var/www/html;'
#}
exec { '/usr/bin/env sed -i "36a \\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default':
}

service { 'nginx':
  ensure  => 'running',
  restart => 'sudo service nginx restart'
}
