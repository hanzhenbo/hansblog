/**
 * Created by Administrator on 2018/6/1.
 */
var send_code = false;
var url = window.location.host;
function validate() {
    $("#code").show();
    $("#captcha").hide();
}

function send() {
        var mobile = $("input[name=mobile]").val();
        var password = $("input[name=password]").val();
        var token = $("input[name=luotest_response]").val();
        if (token == '') {
            return layer.msg("请先完成人机识别验证");
        }
        if (mobile == ''){
            return layer.msg('手机号不能为空');
        }
        if ((/^[1][3,4,5,7,8][0-9]{9}$/.mobile)){
            return layer.msg('手机号格式不正确');
        }
        if (password == '') {
            return layer.msg('密码不能为空');
        }
        return send_code = true;
}


var dcodeSecond = 60;
var codeSecond = 60;
$("span.sendCode").click(function () {
    if (send_code) return;
    var mobile = $("input[name=mobile]").val();
    var token = $("input[name=luotest_response]").val();
    if (token == '') {
        layer.msg("请点击重置验证<br>按钮重新验证")
        return;
    }
    if (mobile == '') {
        layer.msg("请先输入手机号码");
        return;
    }
    $.post('http://'+url+'/luosimaosend',{mobile: mobile, token: token}, function (res) {
        if (res.status == 'success'){
            console.log(res);
            layer.msg(res.msg);
            send_code = true;
            countDown = setInterval(countDownF, 1000);
        }else{
            $("input[name=code]").html("(" + codeSecond + " s)");
            layer.msg('请重置验证');
        }
    });
});
var countDown = null;
var countDownF = function () {
    if (codeSecond == 0) {
        $("span.sendCode").html("重新获取")
        codeSecond = dcodeSecond;
        send_code = false;
        clearInterval(countDown)
    } else {
        $("span.sendCode").html("(" + codeSecond + " s)");
        codeSecond--;
    }
};

$(".submit").on('click', function () {
    var mobile = $("input[name=mobile]").val();
    var code = $("input[name=code]").val();
    var password = $("input[name=password]").val();
    if (code == ''){
        return layer.msg('验证码不能为空');
    }
    $.post('http://'+url+'/register',{mobile: mobile, password: password, code: code}, function (res) {
        console.log(res);
        if (res.code == 200){
            layer.msg('注册成功');
        }else if(res.code == 201){
            layer.msg('您已注册，请登录');
        }else{
            layer.msg('验证码错误');
        }
    });
});

$("button.reset").click(function (e) {
    if ($("input[name='luotest_response']").val() != '') {
        LUOCAPTCHA.reset();
        $(".code").fadeOut(1000, function () {
            $(".captcha").fadeIn(100);
        });
    }
});

