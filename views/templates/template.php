<!DOCTYPE html>
<html lang="en" ng-app="mocla">
<head>
	<meta charset="UTF-8">
	<title><? echo (isset($locals["title"])) ? $locals["title"] : "mocla" ?></title>
	<link rel="stylesheet" href="/assets/css/app.css">
	<link rel="stylesheet" href="/assets/css/jquery.fullPage.css">
	<link rel="stylesheet" href="/assets/css/animate.css">
	<script src="/assets/js/jquery.js"></script>
	<script src="/assets/js/parallax.min.js"></script>
	<script src="/assets/js/notification.js"></script>
	<script src="/assets/js/hello.js"></script>
	<script src="/assets/js/hello-modules/facebook.js"></script>
	<script src="/assets/js/hello-modules/twitter.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.noty.packaged.min.js"></script>
	<script src="/assets/js/cookies.js"></script>
</head>
<body onload="init()" id="body">
	<aside id="menu_aside"></aside>
	<div id="content-holder" class="section">
		<?php
			require $locals["view"];
		?>
	</div>
	<script src="/assets/js/app.js"></script>
	<script>
		if(Notification.permission !== 'granted'){
			Notification.requestPermission();
		}

		<?php if(!isset($_SESSION["user"])){?>
		if (JSON.parse(Cookies.get("session"))) {
			authorize_via_sessionid();
		}
		<?php }?>
		
	</script>
</body>
</html>