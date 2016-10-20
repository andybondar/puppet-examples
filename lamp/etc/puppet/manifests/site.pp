node default {
	include apache
	include apache::vhosts

	$serveremail = 'webmaster@example.com'
	$servername = 'example.com'
}
