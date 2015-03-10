# == Class kibana4::params
#
# This class is meant to be called from kibana4.
# It sets variables according to platform.
#
class kibana4::params {

  $version = "4.0.1"
  $arch = "x64"

  case $::osfamily {
    'Debian': {
      $package_name = 'kibana4'
      $service_name = 'kibana4'
    }
    'RedHat', 'Amazon': {
      $package_name = 'kibana4'
      $service_name = 'kibana4'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
