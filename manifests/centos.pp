class lighttpd::centos inherits lighttpd::base {
  package {
    'lighttpd':
      ensure => installed;
    'libhttpd-fastcgi':
      ensure => installed;
  }
  file {
    '/var/cache/lighttpd':
      ensure => directory,
      require => Package['lighttpd'];
    '/var/cache/lighttpd/compress':
      ensure => directory,
      require => Package['lighttpd'],
      owner => lighttpd, group => lighttpd, mode => 0640;
  }
}
