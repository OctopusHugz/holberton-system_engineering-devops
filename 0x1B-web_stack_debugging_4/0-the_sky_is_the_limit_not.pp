# This manifest configures a server specifically
$command = "/usr/bin/env sed -i 's/15/4096/g' /etc/default/nginx && /usr/sbin/service nginx restart"

exec { 'Fix nginx worker limit':
  command => $command
}
