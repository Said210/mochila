<?php
	require "../model/user.php";
	require "helpers.php";
	session_start();
	// if ($_SERVER['REQUEST_METHOD'] === 'POST') {}
	$action = $_GET["action"];
	//$_SESSION['user'] = serialize($r);
	switch ($action) {
		case 'register':
			$data = $_POST["user"];
			$new_user = new User();
			$u["username"] = $user["username"];;
			$u["email"] = $user["email"];
			$u["password"] = $user["password"];
			$u["tipo_id"] = 1;
			$new_user->save();
			break;
		
		case 'login':
			$new_user = new User();
			$u = $new_user->where("(email = '".$_POST['email']."' OR username = '".$_POST['email']."') AND password = '".$_POST['password']."'", false);
			$_SESSION['user'] = serialize($u);
			var_export($u);
			break;
		case 'test':
			$name = "Juan";
			render("../../login.php", $name);
			break;
		default:
			# code...
			break;
	}
?>