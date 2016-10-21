<?	
	$salida = [];
	$user = [];
	$user["name"] = "Juan";
	$message = "Hola";
	$actual = file_get_contents("index.php");
	preg_match_all("/\<\%(.+)\%\>/",
    $actual,
    $salida,
    PREG_PATTERN_ORDER);
    for ($i=0; $i < count($salida[0]); $i++) { 
    	//echo $salida[0][$i]." => ".eval("echo ".$salida[1][$i].";")."<br>";
    	$actual = str_replace($salida[0][$i], eval("echo ".$salida[1][$i].";"), $actual);
    }
	echo $actual;
?>
<!--
//$salida[0] => Array de originales
//$salida[1] => Array de replace-->