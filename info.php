<?	
	require_once('php/model/user.php');
	$data = $_POST["user"];
	var_dump($data);
	$new_user = new User();
	$new_user->attr["username"] = $data["username"];;
	$new_user->attr["email"] = $data["email"];
	$new_user->attr["fb_id"] = $data["fb_id"];
	$new_user->attr["tipo_id"] = 1;
	$new_user->attr["password"] = $data["password"];
	var_dump($new_user);
?>