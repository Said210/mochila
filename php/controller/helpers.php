<?php
	// function render($file, $props=null){
	// 	$actual = file_get_contents($file);
	// 	preg_match_all("/\<\%(.+)\%\>/",
	//     $actual,
	//     $salida,
	//     PREG_PATTERN_ORDER);
	//     for ($i=0; $i < count($salida[0]); $i++) { 
	//     	$actual = str_replace($salida[0][$i], eval("return ".$salida[1][$i].";"), $actual);
	//     }
	// 	echo $actual;
	// }
	function render($file, $props=null){
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
?>