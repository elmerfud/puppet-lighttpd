class lighttpd::service {

  service {
    'lighttpd':
      ensure => running,
      enable => true,
      hasstatus => true,
      hasrestart => true;
  }

}
