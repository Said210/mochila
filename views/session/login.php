<div class="login">
		<div class="white-box">
			<h4>Iniciar sesión</h4>
			<input required type="text" id="uid" placeholder="Correo o usuario"><br>
			<input required type="password" class="quarter" id="p_1" maxlength="1">
			<input required type="password" class="quarter" id="p_2" maxlength="1">
			<input required type="password" class="quarter" id="p_3" maxlength="1">
			<input required type="password" class="quarter" id="p_4" maxlength="1">
			<br><br>
			<div class="btn green-1 half" onclick="window.validate_login()">Iniciar sesión</div><br>
	  		<span> <a href="/signin">o registrate</a></span>

	  		<button onclick="fb_login()">Facebook</button>
	  		<div id="fb_login"></div>
		</div>
	</div>
</div>
<? require("common.php"); ?>
<script type="text/javascript">
	function init () {
		$(".quarter").on("keyup", function(e){
			var cur = $(e.currentTarget).attr("id");
			if (e.keyCode == 8 || e.keyCode == 37) {
				var i = parseInt(cur.split("_")[1]) - 1;
			} else{
				var i = parseInt(cur.split("_")[1]) + 1 ;
			};
			var n = "#p_"+i;
			$(n).focus();
		});

		if (u = get_query_variable("username")) { // If username is passed via URL
			$("#uid").val(u); // uid = username
		}
	};

	function validate_login(){
		var elements = [
			[$("#uid").val(), validate_not_empty, "#uid"], 
			[$("#p_1").val(), 	validate_not_empty, "#p_1"], 
			[$("#p_2").val(), 	validate_not_empty, "#p_2"], 
			[$("#p_3").val(), 	validate_not_empty, "#p_3"], 
			[$("#p_4").val(), 	validate_not_empty, "#p_4"]
		];
		var pw = $("#p_1").val()+$("#p_2").val()+$("#p_3").val()+$("#p_4").val();
		if (validate(elements)) {
			$.post("/login", {
				uid: $("#uid").val(),
				password: pw,
				device: navigator.sayswho() + " - " + navigator.device()
			}, function(response){
				var data = JSON.parse(response);
				if (typeof(data.id) != "undefined") {
					Cookies.set('session', JSON.stringify({id: data.session.id, uid: data.session.uid}));
					var n = noty({
					    text: 'Pronto cargará tu cuenta, espera, '+data.username,
					    type: 'success',
					    animation: {
					        open: 'animated pulse', // Animate.css class names
					        close: 'animated fadeOutDown', // Animate.css class names
					        speed: 500 // unavailable - no need
					    }
					});
					//window.location.href = "/me";
				}else{
					var n = noty({
					    text: 'Algo no esta bien, intenta de nuevo',
					    type: 'alert',
					    animation: {
					        open: 'animated pulse', // Animate.css class names
					        close: 'animated fadeOutDown', // Animate.css class names
					        speed: 500 // unavailable - no need
					    }
					});
				}
			});
		}else{
			console.log(";C");
		}
	}
</script>