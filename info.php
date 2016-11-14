<?	
	require_once('php/model/user.php');
	session_start();
	// $data = $_POST["user"];
	// var_dump($data);
	// $new_user = new User();
	// $new_user->attr["username"] = $data["username"];;
	// $new_user->attr["email"] = $data["email"];
	// $new_user->attr["fb_id"] = $data["fb_id"];
	// $new_user->attr["tipo_id"] = 1;
	// $new_user->attr["password"] = $data["password"];
	// var_dump($new_user);
	// echo var_export($_SESSION["user"]->attr["session"]["id"]);
	// $s = OOM::factory_f("session");
	//echo var_dump($s);
	// $s = $s->find($_SESSION["user"]->attr["session"]["id"]);
	// echo "<hr>";
	// var_dump($s);
	// $u = $s->fetch("uid", "usuario");
	// echo "<hr>";
	// var_dump($u);
	date_default_timezone_set('America/Mexico_City');
	date('F/j/Y',strtotime($result['postDate']));
?>