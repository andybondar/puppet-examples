node default {
        $serveremail = 'webmaster@example.com'
        $servername = 'example.com'

	include apache
	include apache::vhosts
	include php
}
