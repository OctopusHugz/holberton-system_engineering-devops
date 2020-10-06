# This manifest configures a server specifically
$command = "/usr/bin/env sed -i 's/nofile [0-9]/nofile 10240/g' /etc/security/limits.conf"

exec { 'Change OS config for Holberton user':
  command => $command
}
