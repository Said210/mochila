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
		$props = [
			"view" => 'views/session/login.php',
			'title' => "Login @ Mocla"
			];
		require "views/templates/template.php";
	}
}, 'login');

$router->map( 'POST', '/login', function() {
	UserController::login();
}, 'login_POST');

$router->map( 'DELETE|GET', '/logout', function() {
	UserController::logout();
}, 'logout');

/*
* Sign in
*/
$router->map( 'GET', '/signin', function() {
	if (isset($_SESSION["user"])) {
		header("Location: /");
	}else{
		$props = [
			"view" => 'views/session/register.php',
			'title' => "Signin @ Mocla"
			];
		require "views/templates/template.php";
	}
}, 'Sign In');

$router->map( 'POST', '/register', function() {
	UserController::register();
}, 'register');


$match = $router->match();  
if($match){
	//					Closure			PARAMS
    call_user_func($match['target'], $match['params']);
}else {
	// no route was matched
	header( $_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
}

?>