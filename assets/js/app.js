function validate_empty(message) {
    return message == "";
}
function validate_not_empty(message) {
    return message != "";
}
function validate_email(message) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(message);
}
function validate(elements) {
    console.log(elements);
    var flag = true;
    for (var i = 0; i < elements.length; i++) {
        var tmp = elements[i][1](elements[i][0]);
        if (flag) {
            flag = tmp;
        }
        if (!tmp) {
            $(elements[i][2]).css("border", "1px solid red");
            console.log("Failed: ", elements[i][0], elements[i][1]);
        }
        else {
            $(elements[i][2]).css("border", "1px solid #333");
        }
    }
    return flag;
}
var logout = function (network) {
    hello(network).logout().then(function () {
        alert('Signed out');
    }, function (e) {
        alert('Signed out error: ' + e.error.message);
    });
};
hello.init({
    facebook: '344380529050867'
}, {
    redirect_uri: '/signin'
});
function fb_signin(callback) {
    hello('facebook').login({
        scope: 'email,publish,public_profile',
        redirect_uri: "/signin"
    }).then(function () {
        alert('You are signed in to Facebook');
        callback();
    }, function (e) {
        alert('Signin error: ' + e.error.message);
    });
}
hello.on('auth.login', function (auth) {
    // call user information, for the given network
    get_data(function (data) {
        console.log(data);
    });
});
function get_data(callback) {
    hello('facebook').api('/me').then(function (r) {
        callback(r);
    });
}
function autorized(data_param) {
    $.post("/auth", { data: data_param }, function (data) {
        console.log(data);
    });
}
var online = function (session) {
    var currentTime = (new Date()).getTime() / 1000;
    return session && session.access_token && session.expires > currentTime;
};
///<reference path='validations.ts' />
///<reference path='social.ts' /> 
