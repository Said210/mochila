function validate_empty( message:string ):boolean {
	return message == "";
}

function validate_not_empty( message:string ):boolean {
	return message != "";
}

function validate_email( message:string ):boolean {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(message);
}

function validate( elements ):boolean{
	console.log(elements);
	var flag = true;
	for (var i = 0; i < elements.length; i++) {
		var tmp = elements[i][1](elements[i][0]);
		if (flag) {
			flag = tmp;
		}
		if ( !tmp ) {
			$(elements[i][2]).css("border","1px solid red");
			console.log("Failed: ", elements[i][0], elements[i][1]);
		}else{
			$(elements[i][2]).css("border","1px solid #333");
		}
	}
	return flag;
}