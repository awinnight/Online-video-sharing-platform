<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Oren Video Template</title>
    <%@ include file="../../common/head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="icon" href="static/images/Favicon.png">
    <link rel="stylesheet" type="text/css" href="static/css/animate.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello-codes.css">
    <link rel="stylesheet" type="text/css" href="static/css/thumbs-embedded.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="static/css/color.css">
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/popper.js"></script>
    <script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="static/js/flatpickr.js"></script>
    <script src="static/js/script.js"></script>
    <script src="static/js/layer/layer.js"></script>
    <script>
        function existsUsername(username){
            var flag = true;
            $.ajax({
                url: "http://localhost:8080/mvideo/UserServlet",
                type: "POST",
                data: {
                    action: "existsUsername",
                    username: username
                },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data == "repeat") {
                        $("span[name=unameMsg]").html("用户名已被使用！");
                        flag = false;
                    }
                }
            })
            return flag;
        }
        $(function () {
            $("#signup").click(function () {
                var username = $("[name=username]").val();
                var email = $("#email").val();
                var phone = $("#phone").val();
                var password = $("[name=password]").val();
                var repassword = $("#repassword").val();
                var code = $("#code").val();
                var flag = false;
                //输入验证
                if ((username == "") || (password == "") || (email == "") || (phone == "") || (repassword == "") || (code == "")) {
                    flag = true;
                }
                if(!existsUsername(username)){
                    flag = true;
                }
                if ((username.match(/^\w{5,12}$/) == null)) {
                    $("span[name=unameMsg]").html("用户名不合法！");
                    flag = true;
                }
                if (email.match(/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/) == null) {
                    $("span[name=emailMsg]").text("邮箱格式不合法！");
                    flag = true;
                }
                if (phone.match(/^1[3456789]\d{9}$/) == null) {
                    $("span[name=phoneMsg]").text("手机输入错误！");
                    flag = true;
                }
                if ((password.match(/^\w{5,12}$/) == null)) {
                    $("span[name=pwdMsg]").html("密码不合法！");
                    flag = true;
                }
                if (password != repassword) {
                    $("span[name=repwdMsg]").html("密码不一致！");
                    flag = true;
                }
                if(flag){
                    return;
                }
                //验证账号密码
                $.ajax({
                    url: "http://localhost:8080/mvideo/UserServlet",
                    type: "POST",
                    data: {
                        action: "signup",
                        username: username,
                        email: email,
                        phone: phone,
                        password: password,
                        code: code
                    },
                    dataType: "text",
                    success: function (data) {
                        if (data == "ok") {
                            layer.msg("注册成功，即将跳到登陆页面", {time: 2000}, function () {
                                location.href = "http://localhost:8080/mvideo/pages/user/login.jsp";
                            });
                        } else if (data == "error") {
                            $("span[name=codeMsg]").html("注册失败")
                        } else {
                            $("span[name=codeMsg]").html("验证码错误！");
                        }
                    }
                })
            })

            $("#username").blur(function () {
                var usernametest = /^\w{5,12}$/;
                var usernamevar = $("#username").val();
                if ($("#username").val() == null || $("#username").val() == "") {
                    $("span[name=unameMsg]").html("用户名不能为空！");
                } else if (!usernametest.test(usernamevar)){
                    $("span[name=unameMsg]").html("用户名不合法！");
                } else {
                    existsUsername(usernamevar);
                }
            });

            $("#email").blur(function () {
                var emailtest = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                var emailvar = $("#email").val();
                if ($("#email").val() == null || $("#email").val() == "") {
                    $("span[name=emailMsg]").html("邮箱不能为空！");
                } else if (!emailtest.test(emailvar)){
                    $("span[name=emailMsg]").html("邮箱格式不合法！");
                }
            });

            $("#phone").blur(function () {
                var phonetest = /^1[3456789]\d{9}$/;
                var phonevar = $("#phone").val();
                if ($("#phone").val() == null || $("#phone").val() == "") {
                    $("span[name=phoneMsg]").html("手机号不能为空！");
                } else if (!phonetest.test(phonevar)){
                    $("span[name=phoneMsg]").html("手机格式不合法！");
                }
            });

            $("#password").blur(function () {
                var passwordtest = /^\w{5,12}$/;
                var passwordvar = $("#password").val();
                if ($("#password").val() == null || $("#password").val() == "") {
                    $("span[name=pwdMsg]").html("密码不能为空！");
                } else if (!passwordtest.test(passwordvar)){
                    $("span[name=pwdMsg]").html("密码不合法！");
                }
            });

            $("#repassword").blur(function () {
                var passwordvar = $("#password").val();
                var repasswordvar = $("#repassword").val();
                if ($("#repassword").val() == null || $("#repassword").val() == "") {
                    $("span[name=repwdMsg]").html("确认密码不能为空！");
                } else if (passwordvar != repasswordvar){
                    $("span[name=repwdMsg]").html("密码不一致！");
                }
            });

            $("#code").blur(function () {
                var codevar = $("#code").val();
                if ($("#code").val() == null || $("#code").val() == "") {
                    $("span[name=codeMsg]").html("请输入验证码！");
                }
            });

            // 给验证码的图片，绑定单击事件
            $("#code_img").click(function () {
                // alert(this.src);
                this.src = "${basePath}kaptcha.jpg?d=" + new Date();
            });

            //清除消息
            $("#username").focus(function () {
                $("span[name=unameMsg]").html("");
            })
            $("#email").focus(function () {
                $("span[name=emailMsg]").html("");
            })
            $("#phone").focus(function () {
                $("span[name=phoneMsg]").html("");
            })
            $("#password").focus(function () {
                $("span[name=pwdMsg]").html("");
            })
            $("#repassword").focus(function () {
                $("span[name=repwdMsg]").html("");
            })
            $("#code").focus(function () {
                $("span[name=codeMsg]").html("");
            })
        })
    </script>
</head>
<body>

<div class="wrapper">

    <section class="banner-section p120">
        <div class="container">
            <div class="banner-text">
                <h2>注册</h2>
                <p>Please Register to have access to all videos and many more.</p>
            </div><!--banner-text end-->
        </div>
    </section><!--banner-section end-->

    <section class="form_popup">

        <div class="signup_form" id="signup_form">
            <div class="hd-lg">
                <img src="static/images/logo.png" alt="">
                <span>Register your Oren account</span>
            </div><!--hd-lg end-->
            <div class="user-account-pr">
                <form method="post" action="" onsubmit="return false">
                    <div class="input-sec mgb25">
                        <input type="text" name="username" id="username" placeholder="Username">
                        <label>长度为5-12个字符 由字母和数字组成 _</label>
                        <span name="unameMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec">
                        <input type="email" name="email" id="email" placeholder="Email address" required>
                        <span name="emailMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec">
                        <input type="text" name="phone" id="phone" placeholder="phone" required>
                        <span name="phoneMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec">
                        <input type="Password" name="password" id="password" placeholder="Password" required>
                        <label>长度为5-20个字符 由字母和数字组成 _</label>
                        <span name="pwdMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec">
                        <input type="password" name="repassword" id="repassword" placeholder="Re-enter password"
                               required>
                        <span name="repwdMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec">
                        <label>验证码：</label>
                        <input type="text" style="width: 150px;" id="code" name="code"/>
                        <img style="width:70px;height:25px" alt=""
                             src="http://localhost:8082/mvideo/kaptcha.jpg"
                             style="float: right; margin-right: 40px" id="code_img">
                        <span name="codeMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec mb-0">
                        <button type="submit" id="signup">Signup</button>
                    </div><!--input-sec end-->
                </form>
            </div><!--user-account end--->
            <div class="fr-ps">
                <h1>Already have an account?<a href="pages/user/login.jsp" title="" class="show_signup"> Login here.</a></h1>
            </div><!--fr-ps end-->
        </div><!--login end--->

    </section><!--form_popup end-->

    <section class="more_items_sec br-top text-center">
        <div class="container">
            <a href="#" title="">
                <svg width="19" height="24" viewBox="0 0 19 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18.1618 24.0001H0.838235C0.374412 24.0001 0 23.6261 0 23.1628V5.86052C0 5.39727 0.374412 5.02332 0.838235 5.02332H18.1618C18.6256 5.02332 19 5.39727 19 5.86052V23.1628C19 23.6261 18.6256 24.0001 18.1618 24.0001ZM1.67647 22.3256H17.3235V6.69773H1.67647V22.3256Z"
                          fill="#9494A0"></path>
                    <g opacity="0.25">
                        <path opacity="0.25"
                              d="M13.1324 4.18605C12.6685 4.18605 12.2941 3.81209 12.2941 3.34884V1.67442H6.70589V3.34884C6.70589 3.81209 6.33148 4.18605 5.86765 4.18605C5.40383 4.18605 5.02942 3.81209 5.02942 3.34884V0.83721C5.02942 0.373954 5.40383 0 5.86765 0H13.1324C13.5962 0 13.9706 0.373954 13.9706 0.83721V3.34884C13.9706 3.81209 13.5962 4.18605 13.1324 4.18605Z"
                              fill="#9494A0"></path>
                    </g>
                    <path d="M9.50001 19.3479C9.28487 19.3479 9.06972 19.267 8.90766 19.1024L5.92634 16.1275C5.59942 15.801 5.59942 15.2707 5.92634 14.9442C6.25325 14.6177 6.78413 14.6177 7.11104 14.9442L9.50001 17.3275L11.8862 14.9442C12.2131 14.6177 12.744 14.6177 13.0709 14.9442C13.3978 15.2707 13.3978 15.801 13.0709 16.1275L10.0924 19.1024C9.93031 19.267 9.71516 19.3479 9.50001 19.3479Z"
                          fill="#9494A0"></path>
                    <path d="M9.49999 18.4186C9.03617 18.4186 8.66176 18.0447 8.66176 17.5814V10.3256C8.66176 9.86236 9.03617 9.4884 9.49999 9.4884C9.96382 9.4884 10.3382 9.86236 10.3382 10.3256V17.5814C10.3382 18.0447 9.96382 18.4186 9.49999 18.4186Z"
                          fill="#9494A0"></path>
                    <g opacity="0.5">
                        <path opacity="0.5"
                              d="M15.6471 6.69764C15.1832 6.69764 14.8088 6.32369 14.8088 5.86043V4.18601H4.19118V5.86043C4.19118 6.32369 3.81677 6.69764 3.35294 6.69764C2.88912 6.69764 2.51471 6.32369 2.51471 5.86043V3.34881C2.51471 2.88555 2.88912 2.5116 3.35294 2.5116H15.6471C16.1109 2.5116 16.4853 2.88555 16.4853 3.34881V5.86043C16.4853 6.32369 16.1109 6.69764 15.6471 6.69764Z"
                              fill="#9494A0"/>
                    </g>
                </svg>
            </a>
        </div>
    </section><!--more_items_sec end-->


</div><!--wrapper end-->


</body>
</html>