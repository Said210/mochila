<div class="login signin">
	<div class="white-box">
	<h4>Registrate</h4>
		<label>Email: </label><br>
		<input type="email" class="full" placeholder="Email" id="email">
		<br>
		<label>Username</label><br>
		<input type="text" class="full" placeholder="Username" id="username">
		<br>
		<label>
			Contraseña: (Ingresa solo 4 caracteres). 
		</label><br>
		<input type="password" class="full" placeholder="Pass" maxlength="4" id="password">
		<br>
		<input type="hidden" class="hidden" id="fb_id">
		<div class="btn green-1 half" onclick="sign_in()">Registrarme</div><br>
		<img src="/assets/images/fb.png" onclick="window.fb_signin(fill_form)" id="fb_signin" alt=""><br>
		<a href="/login">
			o inicia sesión
		</a>	
	</div>
</div>

<? require("common.php"); ?>