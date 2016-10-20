class apache::vhosts {

  if $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('apache/vhosts-deb.conf.erb'),
    }
    file { "/var/www/html/$servername":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/logs":
      ensure    => directory,
    }
  } else {
    fail("This is not a supported distro.")  
  }

}
