<?php

require './vendor/autoload.php';
require './php/controller/helpers.php';
$router = new AltoRouter();
$router->map( 'GET', '/example', function() {
	echo "hola";
});

?>