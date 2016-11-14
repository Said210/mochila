<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);

require_once 'vendor/altorouter/altorouter/AltoRouter.php';
require_once 'php/controller/autoload.php';

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
	if (logged()) {
		header("Location: /");
	}else{
		$locals = [
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
	if (logged()) {
		header("Location: /");
	}else{
		$locals = [
			"view" => 'views/session/register.php',
			'title' => "Signin @ Mocla"
			];
		require "views/templates/template.php";
	}
}, 'SignIn');

$router->map( 'POST', '/register', function() {
	UserController::register();
}, 'register');



$router->map("GET", "/me", function(){
	$current_user = $_SESSION["user"]->attr;
	$locals = [
		"view" => 'views/user/profile.php',
		"title" => $current_user["username"]." @ mocla"
	];
	require "views/templates/template.php";
	
});

$match = $router->match();  
if($match){

	//					Closure			PARAMS
    call_user_func($match['target'], $match['params']);
}else {
	// no route was matched
	header( $_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
}

function render_template($template = "template.php", $locals=[]){
	require "views/templates/".$template;
}

?>