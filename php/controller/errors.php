<?
Class Errors{

	public static function login($key){
		$errors = [
			"access_denied" => [
				"description" => "Tus datos no coinciden, intenta de nuevo."
				]
			];
		return $errors[$key];
	}
}
?>