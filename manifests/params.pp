class lighttpd::params {
  
  $log_root = '/var/log/lighttpd'
  $server_root = '/var/www'
  $state_dir = '/var/run'
  $home_dir = '/var/lib/lighttpd'
  $conf_dir = '/etc/lighttpd'
  $vhosts_dir = '/etc/lighttpd/vhosts'
  $cache_dir = '/var/cache/lighttpd'
  $socket_dir = '/var/lib/lighttpd/sockets'
  $server_port = '80'
  $server_bind = undef
  $document_root = '/var/www/lighttpd'
  $server_tag = 'lighttpd'
  $server_pidfile = '/var/run/lighttpd.pid'
  $server_errorlog = '/var/log/lighttpd/error.log'
  $server_eventhandler = 'linux=sysepoll'
  $server_networkbackend = 'linux-sendfile'
  $server_statcacheengine = 'simple'
  $server_maxconnections = '1024'
  $server_maxkeepaliveidle = '30'
  $server_maxkeepaliverequests = '15'
  $staticfile_excludeextenstions = [".php", ".pl", ".fcgi", ".scgi"]
  $server_followsymlink = 'enable'
  $server_uploaddirs = '/var/tmp'

  case $::osfamily {
    'RedHat': {
      $config_file = '/etc/lighttpd/lighttpd.conf'
      $modules_file = '/etc/lighttpd/modules.conf'
      $server_username = 'lighttpd'
      $server_groupname = 'lighttpd'
    }
  }

}
