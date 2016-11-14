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
    //console.log(elements);
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
function get_facebook_data(callback) {
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
function get_query_variable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return false;
}
navigator.sayswho = (function () {
    var ua = navigator.userAgent, tem, M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if (/trident/i.test(M[1])) {
        tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
        return 'IE ' + (tem[1] || '');
    }
    if (M[1] === 'Chrome') {
        tem = ua.match(/\b(OPR|Edge)\/(\d+)/);
        if (tem != null)
            return tem.slice(1).join(' ').replace('OPR', 'Opera');
    }
    M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
    if ((tem = ua.match(/version\/(\d+)/i)) != null)
        M.splice(1, 1, tem[1]);
    return M.join(' ');
});
navigator.device = function () {
    return navigator.userAgent.split(" ")[1].replace("(", "").replace(";", "");
};
///<reference path='validations.ts' />
///<reference path='social.ts' />
///<reference path='util.ts' /> 
