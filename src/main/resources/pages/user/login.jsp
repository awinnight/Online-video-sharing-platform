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
    <link rel="stylesheet" type="text/css" href="static/css/fontello.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello-codes.css">
    <link rel="stylesheet" type="text/css" href="static/css/thumbs-embedded.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="static/css/color.css">
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/popper.js"></script>
    <script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="static/js/script.js"></script>
    <script src="static/js/layer/layer.js"></script>
    <script>
        $(function () {
            $("#login").click(function () {
                var username = $("[name=username]").val();
                var password = $("[name=password]").val();
                //输入验证
                if ((username == "") || (password == "")) {
                    return;
                }
                if ((username.match(/^\w{5,12}$/) == null)) {
                    $("span[name=unameMsg]").html("用户名不合法！");
                    return;
                }
                if ((password.match(/^\w{5,12}$/) == null)) {
                    $("span[name=pwdMsg]").html("密码不合法！");
                    return;
                }
                //验证账号密码
                $.ajax({
                    url: "http://localhost:8080/mvideo/UserServlet",
                    type: "POST",
                    data: {
                        action: "login",
                        username: username,
                        password: password
                    },
                    dataType: "text",
                    success: function (data) {
                        console.log(data)
                        if (data == "ok") {
                            layer.msg("登录成功", {time: 2000}, function () {
                                location.href = "http://localhost:8080/mvideo/index.jsp";
                            });
                        } else if (data == "none") {
                            $("span[name=unameMsg]").html("用户名不存在")
                        } else {
                            $("span[name=pwdMsg]").html("密码输入错误！");
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

            //清除消息
            $("#username").focus(function () {
                $("span[name=unameMsg]").html("");
            })
            $("#password").focus(function () {
                $("span[name=pwdMsg]").html("");
            })
        })
    </script>
</head>
<body>

<div class="wrapper">

    <section class="banner-section p120">
        <div class="container">
            <div class="banner-text">
                <h2>登录</h2>
                <p>Please sign in to have access to all videos and many more.</p>
            </div><!--banner-text end-->
        </div>
    </section><!--banner-section end-->

    <section class="form_popup">

        <div class="login_form" id="login_form">
            <div class="hd-lg">
                <img src="static/images/logo.png" alt="">
                <span>Log into your Oren account</span>
            </div><!--hd-lg end-->
            <div class="user-account-pr">
                <form method="post" action="" onsubmit="return false">
                    <div class="input-sec">
                        <input type="text" name="username" placeholder="Username" id="username" value="${ cookie.userName.value }" required>
                        <span name="unameMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="input-sec">
                        <input type="Password" name="password" placeholder="Password" id="password" class="form-control"
                               required>
                        <span name="pwdMsg" style="text-align: center;display:block;color: red"></span>
                    </div>
                    <div class="chekbox-lg">
                        <label>
                            <input type="checkbox" name="remember" value="rem">
                            <b class="checkmark"> </b>
                            <span>Remember me</span>
                        </label>
                    </div>
                    <div class="input-sec mb-0">
                        <button type="submit" id="login">Login</button>
                    </div><!--input-sec end-->
                </form>
                <a href="#" title="" class="fg_btn">Forgot password?</a>
            </div><!--user-account end--->
            <div class="fr-ps">
                <h1>Don’t have an account? <a href="pages/user/signup.jsp" title="" class="show_signup">Signup here.</a></h1>
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
                              fill="#9494A0"></path>
                    </g>
                </svg>
            </a>
        </div>
    </section><!--more_items_sec end-->


</div><!--wrapper end-->


</body>
</html>