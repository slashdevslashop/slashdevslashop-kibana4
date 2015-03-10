# == Class: kibana4
#
# Full description of class kibana4 here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class kibana4 (
  $version = $::kibana4::params::version,
  $arch = $::kibana4::params::arch,
  $service_name = $::kibana4::params::service_name,
) inherits ::kibana4::params {

  # validate parameters here

  class { '::kibana4::install': 
  	version => $version,
  	arch => $arch
  } ->
  class { '::kibana4::config': } ~>
  class { '::kibana4::service': } ->
  Class['::kibana4']
}
