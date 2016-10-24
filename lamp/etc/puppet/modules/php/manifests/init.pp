class php {

  $phpname = $osfamily ? {
    'Debian'    => 'php5',
    'RedHat'    => 'php',
    default     => warning('This distribution is not supported by the PHP module'),
  }
        
  package { 'php':
    name => $phpname,
    ensure => present,
    require => Package['apache'],
  }

  file { "/var/www/html/$servername/public_html/index.php":
    ensure => file,
    source => "puppet:///modules/php/index.php",
    require => [
      File["/var/www/html/$servername/public_html"],
      Package['php'],
    ],
  }

}
