node default {
	$virtualhosts = hiera('virtualhosts')
	$virtualhostname = keys($virtualhosts)
        $serveremail = $virtualhosts["$virtualhostname"]["serveremail"]
        $servername = $virtualhosts["$virtualhostname"]["servername"]

	include apache
	include apache::vhosts
	include php
}
