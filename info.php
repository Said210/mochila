<?	
	$salida = [];
	$user = [];
	$user["name"] = "Juan";
	$message = "polisia.";
	$actual = "Alo, <% var_export($_GET) %>? Hola, joven."; // file_get_contents("index.php");
	preg_match_all("/\<\%(.+)\%\>/",
    $actual,
    $salida,
    PREG_PATTERN_ORDER);
    for ($i=0; $i < count($salida[0]); $i++) { 
    	echo $salida[0][$i]." => ".eval("return \$salida[1][\$i];")."<br>";
    	$actual = str_replace($salida[0][$i], eval("return \$salida[1][\$i];"), $actual);
    }
	echo $actual;

	function pre_render($value){
		$r = eval("return $value;");
		return $r;
	}
?>