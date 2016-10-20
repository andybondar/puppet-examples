class apache (
  $apachename   = $::apache::params::apachename,
) inherits ::apache::params  {


$conffile   = '/etc/apache2/apache2.conf'
$confsource = 'puppet:///modules/apache/apache2.conf'


  package { 'apache':
    name    => $apachename,
    ensure  => present,
  }

  file { 'configuration-file':
    path    => $conffile,
    ensure  => file,
    source  => $confsource,
    notify  => Service['apache-service'],
  }

  service { 'apache-service':
    name          => $apachename,
    hasrestart    => true,
  }

}
