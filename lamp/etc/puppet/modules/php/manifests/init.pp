class php {

  $databases = hiera('databases')
  $dbname = keys($databases)
  $dbuser = $databases["$dbname"]["user"]
  $dbpass = $databases["$dbname"]["password"]
  $dbgrant = $databases["$dbname"]["grant"]


  $phpname = $osfamily ? {
    'Debian'    => 'php5',
    'RedHat'    => 'php',
    default     => warning('This distribution is not supported by the PHP module'),
  }

  $phpmysqlname = $osfamily ? {
    'Debian'    => 'php5-mysql',
    'RedHat'    => 'php-mysql',
    default     => warning('This distribution is not supported by the PHP module'),
  }

  package { 'php-mysql':
    name => $phpmysqlname,
    ensure => present,
    #before => Package['apache'], ##probably needed
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
  
  file { "/var/www/html/$servername/public_html/mysql-test.php":
    ensure => file,
    content => template('php/mysql-test.php.erb'),
    require => File["/var/www/html/$servername/public_html"],
  }

}
