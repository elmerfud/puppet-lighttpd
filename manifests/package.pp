
class lighttpd::package {

  case $::osfamily {
    'RedHat': {
      include lighttpd::package::redhat
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

