<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);   

require 'vendor/altorouter/altorouter/AltoRouter.php';
require 'php/controller/autoload.php';

$router = new AltoRouter();

// INDEX ROUTE
$router->map( 'GET', '/', function() {
	render("views/index.php");
}, 'home');


// SESSION ROUTES

/*
* login routes
*/
$router->map( 'GET', '/login', function() {
	if (isset($_SESSION["user"])) {
		header("Location: /");
	}else{
		render("views/templates/template.php", ["view" => 'views/session/login.php']);
	}
}, 'login');

$router->map( 'POST', '/login', function() {
	UserController::login();
}, 'login_POST');

$router->map( 'DELETE|GET', '/logout', function() {
	UserController::logout();
}, 'logout');




$match = $router->match();  
if($match){
	//					Closure			PARAMS
    call_user_func($match['target'], $match['params']);
}else {
	// no route was matched
	header( $_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
}

?>