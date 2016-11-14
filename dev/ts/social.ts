var logout = function(network) {
	hello(network).logout().then(function() {
		alert('Signed out');
	}, function(e) {
		alert('Signed out error: ' + e.error.message);
	});
}
hello.init({
  facebook : '344380529050867',
},{
  redirect_uri : '/signin'
});

function fb_signin(callback){
	hello('facebook').login({
		 scope: 'email,publish,public_profile',
		 redirect_uri: "/signin"
	}).then(function() {
		alert('You are signed in to Facebook');
		callback();
	}, function(e) {
		alert('Signin error: ' + e.error.message);
	});
}

hello.on('auth.login', function(auth){
  // call user information, for the given network
  get_data(function(data) {
  	console.log(data);
  });
})

function get_facebook_data(callback) {
	hello( 'facebook' ).api( '/me' ).then( function(r){
  		callback(r); 
	});
}

function autorized(data_param){
	$.post("/auth", {data: data_param}, function(data) {
		console.log(data);
	});
}

var online = function(session) {
	var currentTime = (new Date()).getTime() / 1000;
	return session && session.access_token && session.expires > currentTime;
};