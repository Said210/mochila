<script>
	var fb = hello('facebook').getAuthResponse();
	$(document).ready(function(){
		if (online(fb)) {
			fill_form();
		}
	});

	function fill_form() {
		get_data(function(data){
			$("#email").val(data.email);
			$("#username").val("the_"+data.first_name+"eitor_"+Math.floor((Math.random()+1)*100));
			$("#fb_id").val(data.id);
		});
	}

	function sign_in(){
		var elements = [
			[$("#email").val(), validate_not_empty, "#email"],
			[$("#password").val(), validate_not_empty, "#password"],
			[$("#username").val(), validate_not_empty, "#username"]
		]
		if (validate(elements)){
			var user = {user: {
				email: $("#email").val(),
				username: $("#username").val(),
				password: ""+$("#password").val(),
				fb_id: $("#fb_id").val()
			}};
			$.post("/register", user, function(response){
				var data = JSON.parse(response);
				if (typeod(data.id) == "undefined"){
					var n = noty({
					    text: 'No se pudo crear tu usuario, intenta de nuevo, pls.',
					    type: 'alert',
					    animation: {
					        open: 'animated pulse', // Animate.css class names
					        close: 'animated fadeOutDown', // Animate.css class names
					        speed: 500 // unavailable - no need
					    }
					});
				}else{
					window.location.href = "/login"
				}
			});
		}
	}

</script>