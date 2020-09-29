# This manifest configures a server specifically
$command = "/usr/bin/env sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php"

exec { 'fix Wordpress':
  command => $command
}

service { 'apache2':
  ensure  => 'running'
}
