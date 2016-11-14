<?php
	// This functions renders a view ($file) with some local variables ($locals)
	function render($file, $locals=null){
		$actual = file_get_contents($file);
		$processed = [];
		preg_match_all("/\<\%(\n+|.+)\%\>/",
	    $actual,
	    $salida,
	    PREG_PATTERN_ORDER);
	    for ($i=0; $i < count($salida[0]); $i++) { 
	    	array_push($processed, eval("return ".$salida[1][$i].";"));
	    }
	    for ($i=0; $i < count($salida[0]); $i++) { 
	    	//$actual = str_replace($salida[0][$i], eval("return ".$salida[1][$i].";"), $actual);
	    	$actual = str_replace($salida[0][$i], $processed[$i] , $actual);
	    }
		echo $actual;
	}

	function logged(){
		return isset($_SESSION["user"]);
	}
	function get_user(){
		return $_SESSION["user"];
	}

	function tokenize($length = 10) {
	    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	    $charactersLength = strlen($characters);
	    $randomString = '';
	    for ($i = 0; $i < $length; $i++) {
	        $randomString .= $characters[rand(0, $charactersLength - 1)];
	    }
	    return $randomString;
	}
	// function get_full_current_user(){
	// 	return user::find($_SESSION["user"]["id"]);
	// }
?>