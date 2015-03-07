# == Class kibana4::service
#
# This class is meant to be called from kibana4.
# It ensure the service is running.
#
class kibana4::service {

  service { $::kibana4::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
