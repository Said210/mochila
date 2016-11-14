<?php
    require_once('php/model/session.php');
    require_once('helpers.php');
    require_once('errors.php');
    session_start();
    /**
    * SessionController class
    */
    class SessionController{
    	public static function new_session($user, $data){
			$session = new Session();
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

		public static function drop_session($sid){

		}

    }
?>