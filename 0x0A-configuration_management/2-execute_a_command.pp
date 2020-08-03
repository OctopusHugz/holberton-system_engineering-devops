# This manifest kills a process named killmenow
exec { 'killmenow':
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games',
  command => 'pkill -x killmenow',
  returns => '0'
}
