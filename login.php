<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Mocla</title>
	<link rel="stylesheet" href="/assets/css/app.css">
	<link rel="stylesheet" href="/assets/css/jquery.fullPage.css">
</head>
<body>
	<aside id="menu_aside"></aside>
	<div id="content-holder" class="section">
		<div class="slide slide-1 login">
			<div id="full-scene">
				<div class="parallax-window" data-parallax="scroll" data-image-src="/assets/images/login-2.png"></div>
				<div class="white-box">
					<% 2+2 %>
					<h4>Iniciar sesión</h4>
					<% ($_SESSION["user"]["username"]) %>
					<% var_dump($props) %>
					<input type="text"><br>
					<input type="password" class="quarter" id="first_p" maxlength="1">
					<input type="password" class="quarter" maxlength="1">
					<input type="password" class="quarter" maxlength="1">
					<input type="password" class="quarter" maxlength="1">
					<br><br>
					<div class="btn green-1 half">Iniciar sesión</div><br>
			  		<span> <a href="/signin.php">o registrate</a></span>
				</div>
			</div>
		</div>
		
	</div>

	<script src="/assets/js/jquery.js"></script>
	<script src="/assets/js/parallax.min.js"></script>
</body>
</html>