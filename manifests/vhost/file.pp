define lighttpd::vhost::file(
  $host_def = undef,
  $server_name = undef,
  $document_dir = undef,
  $accesslog = undef,
  $fastcgi_extension = undef,
  $fastcgi_name = undef,
  $fastcgi_host = '127.0.0.1',
  $fastcgi_port = '9001',
  $rewrite_once = undef,
  $ensure = present,
  $vhost_source = 'absent',
  $content = 'absent') {

  file {
    "/etc/lighttpd/vhosts.d/${name}.conf":
      ensure => $ensure,
      notify => Class['lighttpd::service'],
      owner => root, 
      group => 0, 
      mode => 0644,
      content => template('lighttpd/vhost.conf.erb');
    $document_dir:
      ensure => directory;
    "${document_dir}/htdocs":
      ensure => directory;
    "${document_dir}/logs":
      owner => $lightppd::params::username,
      group => $lighttpd::params::groupname,
      ensure => directory;
    "${document_dir}/logs/${accesslog}":
      ensure => $ensure,
      owner => $lightppd::params::username,
      group => $lighttpd::params::groupname;
  }

}
