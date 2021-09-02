<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2020/10/15
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Title</title>
    <%@ include file="../common/head.jsp" %>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="static2/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="static2/dist/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="static2/dist/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="static2/dist/css/AdminLTE.min.css">
    <!-- jQuery 2.2.3 -->
    <script src="static2/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="static2/bootstrap/js/bootstrap.min.js"></script>
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
                        url: "http://localhost:8080/mvideo/ManagerServlet",
                        type: "POST",
                        data: {
                            action: "login",
                            username: username,
                            password: password
                        },
                        dataType: "text",
                        success: function (data) {
                            if (data == "ok") {
                                layer.msg("登录成功", {time: 2000}, function () {
                                    location.href = "http://localhost:8080/mvideo/ManagerServlet?action=list";
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
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
    <div class="lockscreen-logo">
        <a href="../../index2.html"><b>视频分享</b>后台管理系统</a>
    </div>
    <!-- User name -->
    <div style="background-color:white">
        <div class="lockscreen-name"><br></div>
        <div class="lockscreen-name"><h3>登录系统</h3></div>
        <div class="lockscreen-name"><br></div>
        <form action="" method="post" onsubmit="return false">
            <div class="lockscreen-name"><label>用户名称：</label>
                <input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1"
                       name="username" id="username" value="${ cookie.managerName.value }"/>
                <span name="unameMsg" style="text-align: center;display:block;color: red"></span>
            </div>
            <div class="lockscreen-name"><br></div>
            <div class="lockscreen-name"><label>用户密码：</label>
                <input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1"
                       name="password" id="password"/>
                <span name="pwdMsg" style="text-align: center;display:block;color: red"></span>
            </div>
            <div class="lockscreen-name"><br>
            </div>

            <div class="lockscreen-name"><input type="checkbox" value="">记住下次自动登录&emsp;<input type="submit" value="登录"
                                                                                              id="login"/></div>
        </form>
        <div class="lockscreen-name" align="left"><a href="">忘记密码</a></div>
        <div class="lockscreen-name"><br></div>
        <div class="lockscreen-name"><br></div>
    </div>


    <div class="help-block text-center">
        Enter your password to retrieve your session
    </div>
    <div class="text-center">
        <a href="login.html">Or sign in as a different user</a>
    </div>
    <div class="lockscreen-footer text-center">
        Copyright &copy; 2014-2016 <b><a href="http://almsaeedstudio.com" class="text-black">Almsaeed Studio</a></b><br>
        All rights reserved
    </div>
</div>
<!-- /.center -->
</body>
</html>

