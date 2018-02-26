var APF = {
    log: function(v) {
/*
*/
    }
};

APF.Namespace = {
    register: function(ns){
        var nsParts = ns.split(".");
        var root = window;
        for (var i = 0; i < nsParts.length; i++) {
            if (typeof root[nsParts[i]] == "undefined") {
                root[nsParts[i]] = new Object();
            }
            root = root[nsParts[i]];
        }
    }
}

APF.Utils = {
    getWindowSize: function() {
        var myWidth = 0, myHeight = 0;
            if( typeof( window.innerWidth ) == 'number' ) {
            //Non-IE
            myWidth = window.innerWidth;
            myHeight = window.innerHeight;
        } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
            //IE 6+ in 'standards compliant mode'
            myWidth = document.documentElement.clientWidth;
            myHeight = document.documentElement.clientHeight;
        } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
            //IE 4 compatible
            myWidth = document.body.clientWidth;
            myHeight = document.body.clientHeight;
        }
        return {
            width: myWidth,
            height: myHeight
        };
    },

    getScroll: function() {
        var scrOfX = 0, scrOfY = 0;
        if( typeof( window.pageYOffset ) == 'number' ) {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        return {
            left: scrOfX,
            top: scrOfY
        };
    },

    // http://techpatterns.com/downloads/javascript_cookies.php
    setCookie: function(name, value, expires, path, domain, secure) {
        // set time, it's in milliseconds
        var today = new Date();
        today.setTime(today.getTime());
        /*
            if the expires variable is set, make the correct
            expires time, the current script below will set
            it for x number of days, to make it for hours,
            delete * 24, for minutes, delete * 60 * 24
        */
        if (expires) {
            expires = expires * 1000 * 60 * 60 * 24;
        }
        var expires_date = new Date(today.getTime() + (expires));

        document.cookie = name + "=" +escape(value) +
            ((expires) ? ";expires=" + expires_date.toGMTString() : "") +
            ((path) ? ";path=" + path : "") +
            ((domain) ? ";domain=" + domain : "" ) +
            ((secure) ? ";secure" : "" );
    },

    // this fixes an issue with the old method, ambiguous values
    // with this test document.cookie.indexOf( name + "=" );
    getCookie: function(check_name) {
        // first we'll split this cookie up into name/value pairs
        // note: document.cookie only returns name=value, not the other components
        var a_all_cookies = document.cookie.split( ';' );
        var a_temp_cookie = '';
        var cookie_name = '';
        var cookie_value = '';
        var b_cookie_found = false; // set boolean t/f default f

        for (i = 0; i < a_all_cookies.length; i++) {
            // now we'll split apart each name=value pair
            a_temp_cookie = a_all_cookies[i].split( '=' );

            // and trim left/right whitespace while we're at it
            cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');

            // if the extracted name matches passed check_name
            if (cookie_name == check_name) {
                b_cookie_found = true;
                // we need to handle case where cookie has no value but exists (no = sign, that is):
                if (a_temp_cookie.length > 1) {
                    cookie_value = unescape(a_temp_cookie[1].replace(/^\s+|\s+$/g, ''));
                }
                // note that in cases where cookie is initialized but no value, null is returned
                return cookie_value;
                break;
            }
            a_temp_cookie = null;
            cookie_name = '';
        }
        if (!b_cookie_found) {
            return null;
        }
    },

    // this deletes the cookie when called
    deleteCookie: function(name, path, domain) {
        if (this.getCookie(name)) {
            document.cookie = name + "=" +
            ((path) ? ";path=" + path : "") +
            ((domain) ? ";domain=" + domain : "") + ";expires=Thu, 01-Jan-1970 00:00:01 GMT";
        }
    },

    setScrollTop: function (n){
        if (document.body) {
            document.body.scrollTop = n;
            if(document.body.scrollTop == 0){
                if (document.documentElement) document.documentElement.scrollTop = n;
            }
        }else if (document.documentElement) {
            document.documentElement.scrollTop = n;
        }
    },

    getScrollTop: function (){
        return document.body ? document.body.scrollTop || document.documentElement.scrollTop : document.documentElement.scrollTop;
    },

    /*
    *
    * APF.Utils.gotoScrollTop(e, s); 这个函数可传两个参数
    * e 是滚动条滚动到什么地方(end)的缩写，如果不传默认是 0
    * s 是滚动条滚动的速度 ，参数值是默认滚动速度的倍数，比如想要加快滚动速度为默认2倍，输入2 ，如果想放慢速度
    *   到默认速度的一半，输入 0.5 。 如果不传默认是 1，就是默认速度。
    */
    gotoScrollTop: function (e, s){
        var t = APF.Utils.getScrollTop(), n = 0, c = 0;
        var s = s || 1;
        var e = e || 0;
        var i = t > e ? 1 : 0;
        (function() {
            t = APF.Utils.getScrollTop();
            n = i ? t - e : e - t;
            c = i ? t - n / 15 * s : t + 1 + n / 15 * s ;
            APF.Utils.setScrollTop( c );
            if (n <= 0 || t == APF.Utils.getScrollTop()) return;
            setTimeout(arguments.callee, 10);
        })();
    }
};
(function($) {
    var init = {
        loginCommon:function(userNameObj,passWordObj,erroObj, message) {//登录共用验证函数
            if(message) {
                erroObj.addClass("tip_error_ico");
                erroObj.html(message);
                return false;
            }

            var userName = $.trim(userNameObj.val());
            var passWord = $.trim(passWordObj.val());
            var errorText = "";
            var check = true;
            if(!userName || userName == undefined || (userName == "输入用户名")) {
                init.inputChangeCssEvent(userNameObj,"input_border_error","add");
                errorText = "用户名不能为空!";
                check = false;
            }
            if (!passWord || passWord == undefined) {
                if (!check) {
                    errorText = "用户名或密码不能为空!";
                } else {
                    errorText = "密码不能为空!";
                }
                init.inputChangeCssEvent(passWordObj,"input_border_error","add");
                check = false;
            }
            if (!check) {
                erroObj.addClass("tip_error_ico");
                erroObj.html(errorText);
            } else {
                erroObj.removeClass("tip_error_ico");
                erroObj.html("");
            }
            return check;
        },
        ershoufangLogin:function() {//二手房登录表单验证函数
            var userNameObj = $("#p_username");
            var passWordObj = $("#p_password");
            var erroObj = $("#p_tip");
            return this.loginCommon(userNameObj,passWordObj,erroObj);
        },
        inputFocusEvent:function(obj,text) {//文本输入框获得焦点处理统一事件
            var value = $.trim(obj.val());
            if (value == text) {
                obj.val("");
            }
            obj.removeClass("c_grayc");
        },
        inputBlurEvent:function(obj,text) {//文本输入框失去焦点处理统一事件
            var value = $.trim(obj.val());
            if (!value || value == undefined) {
                obj.val(text).addClass("c_grayc");
            }
        },
        inputChangeCssEvent:function(obj,newClass,action) {//样式统一控制函数,input对象+事件名+新样式+样式行为类型（add或者remove）
            if (action == "add") {
                obj.addClass(newClass);
            } else {
                obj.removeClass(newClass);
            }
        }
    };
    $(document).ready(function() {
        //二手房登录form提交事件
        $("#ershoufang_login").bind("submit",function() {
            return init.ershoufangLogin();
        });

        //用户和密码文本输入框focus+blur事件
        var inputTextObj = $("input.default_color");
        inputTextObj.each(function() {
            $(this).bind("focus",function() {
                init.inputChangeCssEvent($(this),"input_border_edit","add");//增加获得焦点样式
                init.inputChangeCssEvent($(this),"input_border_error","remove");//移除获得焦点样式
                if ($(this).attr("id") && $(this).attr("id") == "p_username") {//二手房用户名输入框
                    init.inputFocusEvent($(this),"输入用户名");
                }
            });
            $(this).bind("blur",function() {
                init.inputChangeCssEvent($(this),"input_border_edit","remove");
                if ($(this).attr("id") && $(this).attr("id") == "p_username") {//二手房用户名输入框
                    init.inputBlurEvent($(this),"输入用户名");
                }
            });
        });

        //提交按钮focue+blur事件
        var submitObj = $("input[type='submit']");
        submitObj.each(function() {
            //开启提交事件
            $(this).attr("disabled",false);
            $(this).bind("mouseover",function() {
                init.inputChangeCssEvent($(this),"login_hoverbtn","add");
            });
            $(this).bind("mouseleave",function() {
                init.inputChangeCssEvent($(this),"login_hoverbtn","remove");
            });
        });
    });
})(jQuery);
