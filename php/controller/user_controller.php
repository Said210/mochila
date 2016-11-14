<?php
	
	require_once('php/model/user.php');
	require_once('php/model/mocla.php');
	require_once('helpers.php');
	require_once('errors.php');
	session_start();
	/**
	* UserController class
	*/
	class UserController{
		public static function register($param_user = null) {
			$data = ($param_user == null) ? $_POST["user"] : $param_user;
			$new_user = new User();
			$new_user->attr["username"] = $data["username"];;
			$new_user->attr["email"] = $data["email"];
			$new_user->attr["tipo_id"] = 1;
			$new_user->attr["password"] = "" + $data["password"];
			$new_user->attr["fb_id"] = (isset($data["fb_id"])) ? $data["fb_id"] : "";
			if ($new_user->save()) {
				$new_user = $new_user->find_by("email", $data["email"])[0];
				// Creating Session
				
				UserController::new_session($new_user, $data);

			    $new_mocla = new Mocla();
			    $new_mocla->attr["capacity"] = 100;
			    $new_mocla->attr["diseno_id"] = 1;
			    $new_mocla->attr["user_id"] = $new_user->attr["id"];
			    $new_mocla->save();
			 // Print in json   a new user  which    email is data["email"] only the first
				echo json_encode($new_user);
				echo json_encode($session);
				echo json_encode($new_mocla);
			}
		}

		public function authorize_with_session_id($session_id = ""){
			$session = OOM::factory_f("session"); // Create a new session oom instace
			$current_session = $session->find($session_id);
			if (isset($current_session)) {
				$u = $User->find($session->attr["uid"]);
				$u->attr["session"] = $current_session->attr;
				return json_encode($u);
			}else{
				// NOPE
			}
		}

		public static function login($param_user = null){

			// instance $user to be 
			if (isset($param_user)) {
				$user = $param_user;
			}else{
				$user = [
					"uid" 	=> (isset($_POST["uid"])) 	? $_POST['uid'] : "",
					"password" 	=> (isset($_POST["password"])) 	? $_POST['password'] : ""
				];
			}

			$new_user = new User();
			// 	find users  where  |-----------email or username are equals to uid-------------| AND match with the given password
			$u = $new_user->where("(email = '".$user['uid']."' OR username = '".$user['uid']."') AND password = '".$user['password']."'");
			if (isset($u[0])) {
				$session = UserController::new_session($u[0], $_POST);
				$u[0]->attr["session"] = $session->attr;
				$_SESSION['user'] = $u[0];
				echo json_encode($u[0]->attr);
				return $u;
			}else{
				echo json_encode(Errors::login("access_denied"));
				return null;
			}
		}

		public static function update($param_user = null) {
			$data = ($param_user == null) ? $_POST["user"] : $param_user;
			$new_user = $User->find($data["id"]);
			$new_user["username"] = $data["username"];;
			$new_user["email"] = $data["email"];
			$new_user["password"] = $data["password"];
			$new_user["tipo_id"] = 1;
			$new_user->update();
			return $new_user;
		}

		public static function logout(){
			session_destroy();
			header('Location: /');
		}


		public static function new_session($user, $data){
			$session = OOM::factory_f("session");
			$session->attr["id"] = tokenize(20);
			$session->attr["uid"] = $user->attr["id"];
		    $session->attr["ip"] = $_SERVER['REMOTE_ADDR'];
		    $clientDetails = json_decode(file_get_contents("http://ipinfo.io/".$session->attr['ip']."/json")); // Get location
		    $session->attr["data"] = "";
		    foreach($clientDetails as $key=>$value) {
			  $session->attr["data"] .= "<b>".$key."</b>:".$value."<br>";
			}
		    $session->attr["data"] .= "<b>From</b>:" . $data["device"] . ".";
		   	$session->save();
		   	return $session->find($session->attr["id"]);
		}
	}
?>