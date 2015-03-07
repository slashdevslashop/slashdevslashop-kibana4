# == Class kibana4::install
#
# This class is called from kibana4 for install.
#
class kibana4::install {

  package { $::kibana4::package_name:
    ensure => present,
  }
}
