<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Mocla</title>
	<link rel="stylesheet" href="/assets/css/app.css">
	<link rel="stylesheet" href="/assets/css/jquery.fullPage.css">
	<script src="/assets/js/jquery.js"></script>
	<script src="/assets/js/parallax.min.js"></script>
</head>
<body onload="init()">
	<aside id="menu_aside"></aside>
	<div id="content-holder" class="section">
		<% render($props["view"], $props) %>
	</div>

</body>
</html>