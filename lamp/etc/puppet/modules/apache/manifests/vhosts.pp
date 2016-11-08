class apache::vhosts {

  if $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content => template('apache/vhosts-deb.conf.erb'),
      require => Package['apache'],
#      notify  => Service['apache-service'],
    }
    file { "/etc/apache2/sites-enabled/$servername.conf":
      ensure => link,
      target => "/etc/apache2/sites-available/$servername.conf",
      require => [ 
        Package['apache'],
        File['configuration-file'],
        File["/var/www/html/$servername"],
        File["/var/www/html/$servername/public_html"],
        File["/var/www/html/$servername/logs"],
      ],
      notify  => Service['apache-service'],
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
    file { "/tmp/virthost":
       content => inline_template("export VIRTHOST=${servername}"),
       mode => "0666",
    }
  } else {
    fail("This is not a supported distro.")  
  }

}
