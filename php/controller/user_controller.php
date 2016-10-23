<?php
	
	require_once('php/model/user.php');
	require_once('helpers.php');
	session_start();
	/**
	* UserController class
	*/
	class UserController{
		public static function register($param_user = null) {
			$data = ($param_user == null) ? $_POST["user"] : $param_user;
			$new_user = new User();
			$new_user["username"] = $data["username"];;
			$new_user["email"] = $data["email"];
			$new_user["password"] = $data["password"];
			$new_user["tipo_id"] = 1;
			$new_user->save();
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
			// 	find users  where  |-----------email or username are equals to uid-------------| AND match with the given password, but don't return oom
			$u = $new_user->where("(email = '".$user['uid']."' OR username = '".$user['uid']."') AND password = '".$user['password']."'", false);
			if (isset($u[0])) {
				$_SESSION['user'] = $u[0];
				echo json_encode($u);
				return $u;
			}else{
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

	}
?>