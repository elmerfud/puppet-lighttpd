class lighttpd::config(
  $log_root = $lighttpd::params::log_root,
  $server_root = $lighttpd::params::server_root,
  $state_dir = $lighttpd::params::state_dir,
  $home_dir = $lighttpd::params::home_dir,
  $conf_dir = $lighttpd::params::conf_dir,
  $vhosts_dir = $lighttpd::params::vhosts_dir,
  $cache_dir = $lighttpd::params::cache_dir,
  $socket_dir = $lighttpd::params::socket_dir,
  $server_port = $lighttpd::params::server_port,
  $server_bind = $lighttpd::params::server_bind,
  $server_username = $lightppd::params::username,
  $server_groupname = $lighttpd::params::groupname,
  $document_root = $lighttpd::params::document_root,
  $server_tag = $lighttpd::params::server_tag,
  $server_pidfile = $lighttpd::params::server_pidfile,
  $server_errorlog = $lighttpd::params::server_errorlog,
  $server_eventhandler = $lighttpd::params::server_eventhandler,
  $server_networkbackend = $lighttpd::params::server_networkbackend,
  $server_statcacheengine = $lighttpd::params::server_statcacheengine,
  $server_maxconnections = $lighttpd::params::server_maxconnections,
  $server_maxkeepaliveidle = $lighttpd::params::server_maxkeepaliveidle,
  $server_maxkeepaliverequests = $lighttpd::params::server_maxkeepaliverequests,
  $staticfile_excludeextensions = $lighttpd::params::staticfile_excludeextensions,
  $server_followsymlink = $lighttpd::params::server_followsymlink,
  $server_uploaddirs = $lighttpd::params::server_uploaddirs,
  $modules = ['accesslog', 'access']
) inherits lighttpd::params {

  file {
    $lighttpd::params::config_file:
      content => template('lighttpd/lighttpd.conf.erb'),
      mode => '0644',
      notify => Class['lighttpd::service'];
    $lighttpd::params::modules_file:
      content => template('lighttpd/modules.conf.erb'),
      mode => '0644',
      notify => Class['lighttpd::service'];
  }

  lighttpd::module {
    $modules:
      content => true,
      notify => Class['lighttpd::service'];
  }

}
