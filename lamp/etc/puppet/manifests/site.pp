node default {
        $serveremail = 'webmaster@example.com'
        $servername = 'example.com'
	$module_mysql = 'puppetlabs-mysql'

	include apache
	include apache::vhosts
	include php
	include mysql::server
}
