class lighttpd::vhosts {
  file{'/etc/lighttpd/vhosts.d':
    source => "puppet:///modules/common/empty",
    ensure => directory,
    purge => true,
    recurse => true,
    require => Package['lighttpd'],
    notify => Service['lighttpd'],
    owner => root, group => 0, mode => 0644;
  }

  file{'/var/www/vhosts':
    ensure => directory,
    require => Package['lighttpd'],
    owner => root, group => 0, mode => 0644;
  }
}
