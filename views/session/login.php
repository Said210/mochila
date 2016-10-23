<div class="login">
		<div class="white-box">
			<h4>Iniciar sesión</h4>
			<input type="text"><br>
			<input type="password" class="quarter" id="p_1" maxlength="1">
			<input type="password" class="quarter" id="p_2" maxlength="1">
			<input type="password" class="quarter" id="p_3" maxlength="1">
			<input type="password" class="quarter" id="p_4" maxlength="1">
			<br><br>
			<div class="btn green-1 half">Iniciar sesión</div><br>
	  		<span> <a href="/signin">o registrate</a></span>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(".quarter").on("keyup", function(e){
		console.log(e);
	});
</script>