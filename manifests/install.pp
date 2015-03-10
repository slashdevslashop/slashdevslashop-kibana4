# == Class kibana4::install
#
# This class is called from kibana4 for install.
#
class kibana4::install(
	$version,
	$arch
	) {

  exec {"check_presence":
    command => '/bin/true',
    onlyif => '/usr/bin/test -e /opt/kibana4',
  }

  archive { "kibana4":
   ensure => present,
   url => "https://download.elasticsearch.org/kibana/kibana/kibana-${version}-linux-${arch}.tar.gz",
   target => '/opt/kibana4',
   follow_redirects => true,
   extension => 'tgz',
   checksum => false,
   require => Exec["check_presence"],

  }

}
