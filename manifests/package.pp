
class lighttpd::package {
  anchor { 'lighttpd::package::begin': }
  anchor { 'lighttpd::package::end': }
  case $::osfamily {
    'RedHat': {
      class {
        'lighttpd::package::redhat':
          require => Anchor['lighttpd::package::begin'],
          before => Anchor['lighttpd::package::end'];
      }
    }
  }
}

class lighttpd::package::redhat {
  package {
    'lighttpd':
      ensure => present;
    'lighttpd-fastcgi':
      ensure => present;
  }

}

