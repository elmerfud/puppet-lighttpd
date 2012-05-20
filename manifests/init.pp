# manifests/init.pp - manage lighttpd stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class lighttpd {
  class {
    'lighttpd::package':
      notify => Class['lighttpd::service'];
  }

  class {
    'lighttpd::config': 
      require => Class['lighttpd::package'],
      notify => Class['lighttpd::service'];
  }

  anchor {
    'lighttpd::begin':
      before => Class['lighttpd::package'],
      notify => Class['lighttpd::service'];
    'lighttpd::end':
      requre => Class['lighttpd::service'];
  }
#  case $operatingsystem {
#    /Debian|Ubuntu/: { 
#      include lighttpd::debian 
#    }
#    /RedHat|CentOS/: { 
#      include lighttpd::centos 
#    }
#    default: { 
#      include lighttpd::base 
#    }
#  }

#  if $use_shorewall {
#    include shorewall::rules::http
#  }
#  if $use_munin {
#    include lighttpd::munin
#  }
}

