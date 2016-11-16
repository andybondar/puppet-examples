class php::app {

  file { "/var/www/html/$servername/public_html/index.php":
    ensure => file,
    source => "puppet:///modules/php/index-app.php",
  }

}
