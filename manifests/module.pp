define lighttpd::module(
  $ensure = present,
  $source = undef,
  $content = undef,
  $notify = undef ) {

  $file_name = "${name}.conf"

  file {
    $file_name:
      path => "${lighttpd::params::conf_dir}/conf.d/${file_name}",
      mode => 644,
      owner => root,
      group => root,
      ensure => $ensure,
      notify => $notify,
      source => $source ? {
        undef => undef,
        true => "puppet:///modules/lighttpd/${file_name}",
        default => $source
      }
      content => $content ? {
        undef => undef,
        true => template("lighttpd/${file_name}.erb"),
        defualt => template($content)
 

}

