<?php
/*
	Build by eulr @ eulr.mx
	hola@eulr.mx
	V1.0
*/
	class Connection{


		function connect($db){
			$servername = "localhost"; // HOST TO CONNECT
			$username = "root"; // MYSQL USERNAME
			$password = ""; // MYSQL PASSWORD
			if ($_SERVER["HTTP_HOST"] == "localhost") { // IF YOU WANT TO CHANGE IT DEPENDING WHERE IT'S RUNNING
				$username = "root";
				$password = "";
			}

			// Create connection
			$conn = mysqli_connect($servername, $username, $password, $db);

			// Check connection
			if (!$conn) {
			    die("Connection failed:".var_dump($conn));
			} 

			return $conn;
		}
	}
?>