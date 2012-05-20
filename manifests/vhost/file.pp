define lighttpd::vhost::file(
  $host_def = undef,
  $server_name = undef,
  $document_dir = undef,
  $accesslog = undef,
  $ensure = present,
  $vhost_source = 'absent',
  $content = 'absent') {

  file {
    "/etc/lighttpd/vhosts.d/${name}.conf":
      ensure => $ensure,
      notify => Class['lighttpd::service'],
      owner => root, group => 0, mode => 0644,
      content => template('lighttpd/vhost.conf.erb');
    $document_dir:
      ensure => directory;
    "${document_dir}/htdocs":
      ensure => directory;
    "${document_dir}/logs":
      ensure => directory;
    "${document_dir}/logs/${accesslog}":
      ensure => $ensure,
      user => $lightppd::params::username,
      group => $lighttpd::params::groupname;
  }

}
