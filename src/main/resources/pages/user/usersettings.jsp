<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ikutarian
  Date: 2020/10/19
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    String balance = user.getWallet().toString();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Oren Video Template</title>
    <%-- 静态包含 base 标签 --%>
    <%@ include file="../../common/head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="icon" href="images/Favicon.png">
    <link rel="stylesheet" type="text/css" href="static/css/animate.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello-codes.css">
    <link rel="stylesheet" type="text/css" href="static/css/thumbs-embedded.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="static/css/color.css">

</head>
<body>

<div class="wrapper">

    <header>
        <div class="top_bar">
            <div class="container">
                <div class="top_header_content">
                    <div class="menu_logo">
                        <a href="index.jsp" title="" class="logo">
                            <img src="static/images/logo.png" alt="">
                        </a>
                    </div><!--menu_logo end-->
                    <div class="search_form">
                        <form>
                            <input type="text" name="search" placeholder="Search Videos" id="search">
                            <button type="button" id="searchbtn">
                                <i class="icon-search"></i>
                            </button>
                        </form>
                    </div><!--search_form end-->
                    <c:if test="${ not empty sessionScope.user }">
                        <ul class="controls-lv">
                            <li class="user-log">
                                <div class="user-ac-img">
                                    <img src="static/images/resources/user-img.png" alt="">
                                </div>
                                <div class="account-menu">
                                    <h4>${sessionScope.user.nickName}
                                        <c:if test="${ sessionScope.user.status == 1}">
                                            <span class="usr-status">VIP</span>
                                        </c:if>
                                    </h4>
                                    <div class="sd_menu">
                                        <ul class="mm_menu">
                                            <li>
												<span>
													<i class="icon-user"></i>
												</span>
                                                <a href="UserServlet?action=userSetting" title="">我的账户</a>
                                            </li>
                                            <li>
												<span>
													<i class="icon-paid_sub"></i>
												</span>
                                                <a href="UserServlet?action=userSetting" title="">我的钱包</a>
                                            </li>
                                            <li>
												<span>
													<i class="icon-playlist"></i>
												</span>
                                                <a href="VideoServlet?action=videoManage" title="">视频管理</a>
                                            </li>
                                            <li>
												<span>
													<i class="icon-logout"></i>
												</span>
                                                <a href="UserServlet?action=logout" title="">登出</a>
                                            </li>
                                        </ul>
                                    </div><!--sd_menu end-->
                                </div>
                            </li>
                            <li>
                                <a href="UploadServlet?action=show" title="" class="btn-default">上传</a>
                            </li>
                        </ul>
                        <!--controls-lv end-->
                    </c:if>
                    <div class="clearfix"></div>
                </div><!--top_header_content end-->
            </div>
        </div><!--header_content end-->
        <div class="btm_bar">
            <div class="container">
                <div class="btm_bar_content">
                    <nav>
                        <ul>
                            <li><a href="#" title="">首页</a>
                                <div class="mega-menu">
                                    <ul>
                                        <li><a href="index.jsp" title="">Homepage</a></li>
                                        <li><a href="single_video_page.html" title="">Single Video Page</a></li>
                                        <li><a href="Single_Video_Simplified_Page.html" title="">Single Video Simplified
                                            Page</a></li>
                                        <li><a href="single_video_fullwidth_page.html" title="">Singel Video Full Width
                                            Page</a></li>
                                        <li><a href="single_video_playlist.html" title="">Single Video Playlist Page</a>
                                        </li>
                                        <li><a href="pages/video/uploadvideo.jsp" title="">Upload Video Page</a></li>
                                        <li><a href="Upload_Edit.html" title="">Upload Video Edit Page</a></li>
                                        <li><a href="Browse_Channels.html" title="">Browse channels page</a></li>
                                        <li><a href="Searched_Videos_Page.html" title="">Searched videos page</a></li>
                                    </ul>
                                    <ul>
                                        <li><a href="#" title="">Single channel <span
                                                class="icon-arrow_below"></span></a>
                                            <ul>
                                                <li><a href="Single_Channel_Home.html" title="">Single Channel Home
                                                    page</a></li>
                                                <li><a href="Single_Channel_Videos.html" title="">Single Channel videos
                                                    page</a></li>
                                                <li><a href="Single_Channel_Playlist.html" title="">single channel
                                                    playlist page</a></li>
                                                <li><a href="Single_Channel_Channels.html" title="">single channel
                                                    channels page</a></li>
                                                <li><a href="Single_Channel_About.html" title="">single channel about
                                                    page</a></li>
                                                <li><a href="Single_Channel_Products.html" title="">single channel
                                                    products page</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="pages/video/historypage.jsp" title="">History page</a></li>
                                        <li><a href="Browse_Categories.html" title="">Browse Categories Page</a></li>
                                        <li><a href="Updates_From_Subs.html" title="">Updates from subscription page</a>
                                        </li>
                                        <li><a href="pages/user/login.jsp" title="">login page</a></li>
                                        <li><a href="pages/user/signup.jsp" title="">signup page</a></li>
                                        <li><a href="pages/user/usersettings.jsp" title="">User account page</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li><a href="pages/video/searchpage.jsp" title="">搜索视频</a></li>
                            <li><a href="VideoServlet?action=queryVipVideo&pagesize=8&pageno=1" title="">会员专区</a></li>
                        </ul>
                    </nav><!--navigation end-->
                    <c:if test="${ not empty sessionScope.user }">
                        <ul class="shr_links">
                            <li>
                                <h3>Go to : </h3>
                            </li>
                            <li>
                                <button data-toggle="tooltip" data-placement="top" title="收藏视频"
                                        onclick="window.location.href='CollectionServlet?action=queryCollectionByUser&pagesize=8&pageno=1'">
                                    <i class="icon-like"></i>
                                </button>
                            </li>
                            <li>
                                <button data-toggle="tooltip" data-placement="top" title="历史记录"
                                        onclick="window.location.href='HistoryServlet?action=pageHistory&pagesize=8&pageno=1'">
                                    <i class="icon-history"></i>
                                </button>
                            </li>
                        </ul>
                        <!--shr_links end-->
                    </c:if>
                    <div class="clearfix"></div>
                </div><!--btm_bar_content end-->
            </div>
        </div><!--btm_bar end-->
    </header><!--header end-->


    <section class="user-account">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="sidebar">
                        <div class="widget video_info pr sp">
								<span class="vc_hd">
									<img src="static/images//resources/sn.png" alt="">
								</span>
                            <h4>${ sessionScope.user.nickName }
                                <c:if test="${ sessionScope.user.status == 1}">
                                    <i class="icon-purchased"></i>
                                </c:if></h4>
                            <span>Last Login: 42 minutes ago</span>
                        </div><!--video_info pr-->
                        <div class="widget account">
                            <h2 class="hd-uc"><i class="icon-user"></i> 我的账户</h2>
                            <a href="pages/user/usersettings.jsp">个人资料修改</a>
                        </div><!--account end-->
                        <div class="widget notifications">
                            <h2 class="hd-uc"><i class="icon-paid_sub"></i>我的钱包</h2>
                            <ul>
                                <li> <a href="javascript:(0)" title="" id="walletcharge">账号充值</a></li>
                                <li><a href="javascript:(0)" title="" id="vippurchase">购买会员</a></li>
                            </ul>
                        </div><!--notifications end-->
                        <div class="widget donation">
                            <h2 class="hd-uc"><i class="icon-playlist"></i>视频管理 </h2>
                            <ul>
                                <li><a href="VideoServlet?action=videoManage">已上传视频</a></li>
                                <li><a href="VideoServlet?action=videoManage">待审核视频</a></li>
                                <li><a href="VideoServlet?action=videoManage">下架视频</a></li>
                            </ul>
                        </div><!--donation end-->
                    </div><!--sidebar end-->
                </div>
                <div class="col-lg-9">
                    <div class="video-details">


                        <div class="account-details">
                            <div class="account_details_content">
                                <h2 class="hd-op"> 个人资料 </h2>
                                <form onsubmit="return false">

                                    <h4 class="slct-hd">用户名</h4>
                                    <div class="ch-pswd">
                                        <input type="text" name="nickName" id="nickName" placeholder="nickName" value="${ sessionScope.user.nickName }">
                                        <label>长度为5-20个字符 由字母和数字组成 </label>
                                        <span name="unameMsg" style="text-align: center;display:block;color: red"></span>
                                    </div><!--ch-pswd end-->

                                    <h4 class="slct-hd">邮箱</h4>
                                    <div class="ch-pswd">
                                        <input type="email" name="email" id="email" placeholder="email" value="${ sessionScope.user.email }">
                                        <span name="emailMsg" style="text-align: center;display:block;color: red"></span>
                                    </div><!--ch-pswd end-->

                                    <h4 class="slct-hd">手机号</h4>
                                    <div class="ch-pswd">
                                        <input type="text" name="phone" id="phone" placeholder="phone" value="${ sessionScope.user.phone }">
                                        <span name="phoneMsg" style="text-align: center;display:block;color: red"></span>
                                    </div><!--ch-pswd end-->

                                        <h4 class="slct-hd">个性签名</h4>
                                        <div class="ch-pswd">
                                            <input name="sign" id="sign" placeholder="sign" value="${ sessionScope.user.sign }"></input>
                                        </div>

                                    <div class="ch-pswd">
                                        <button type="submit" id="update"> Update</button>
                                    </div><!--ch-pswd end-->
                                </form>
                            </div><!--account_details_content end-->
                            <div class="clearfix"></div>
                        </div><!--Account Details end-->

                        <div class="change-pswd">
                            <h2 class="hd-op">修改密码</h2>
                            <label>长度为5-20个字符 由字母和数字组成 </label>
                            <form onsubmit="return false">
                                <div class="ch-pswd">
                                    <input type="password" name="old_password" id="old_password" placeholder="Old Password">
                                    <span name="oldpwdMsg" style="text-align: center;display:block;color: red"></span>
                                </div><!--ch-pswd end-->
                                <div class="ch-pswd">
                                    <input type="password" name="password" id="password" placeholder=" New Password">
                                    <span name="pwdMsg" style="text-align: center;display:block;color: red"></span>
                                </div><!--ch-pswd end-->
                                <div class="ch-pswd">
                                    <input type="password" name="repassword" id="repassword" placeholder="Confirm New Password">
                                    <span name="repwdMsg" style="text-align: center;display:block;color: red"></span>
                                </div><!--ch-pswd end-->
                                <div class="ch-pswd">
                                    <button type="submit" id="updatepassword"> Update</button>
                                </div><!--ch-pswd end-->
                            </form>
                        </div><!--change-pswd end-->

                    </div><!--video-details end-->
                </div>
            </div>
        </div>
    </section><!--user-account end-->

</div><!--wrapper end-->

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
        //修改个人信息
        $("#update").click(function () {
            var nickName = $("#nickName").val();
            var email = $("#email").val();
            var phone = $("#phone").val();
            var sign = $("#sign").val();
            var flag = false;
            //输入验证
            if ((nickName == "") || (email == "") || (phone == "")) {
                flag = true;
            }
            if(!existsUsername(nickName)){
                flag = true;
            }
            if ((nickName.match(/^\w{5,12}$/) == null)) {
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
            if(flag){
                return;
            }
            //执行修改个人信息
            $.ajax({
                url: "http://localhost:8080/mvideo/UserServlet",
                type: "POST",
                data: {
                    action: "update",
                    nickName: nickName,
                    email: email,
                    phone: phone,
                    sign: sign
                },
                dataType: "text",
                success: function (data) {
                    if (data == "ok") {
                        layer.msg("个人资料修改成功", {time: 2000}, function () {
                            location.reload();
                        });
                    } else {
                        layer.msg("个人资料修改失败", {time: 2000});
                    }
                }
            })
        })

        //修改密码
        $("#updatepassword").click(function () {
            var old_password = $("#old_password").val();
            var password = $("#password").val();
            var repassword = $("#repassword").val();
            var flag = false;
            //输入验证
            if ((old_password == "") || (password == "") || (repassword == "")) {
                flag = true;
            }
            if (old_password != ${ sessionScope.user.password }) {
                $("span[name=oldpwdMsg]").html("密码输入错误！");
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
            //执行修改密码
            $.ajax({
                url: "http://localhost:8080/mvideo/UserServlet",
                type: "POST",
                data: {
                    action: "update",
                    flag: 1,
                    password: password
                },
                dataType: "text",
                success: function (data) {
                    if (data == "ok") {
                        layer.msg("密码修改成功", {time: 2000}, function () {
                            location.reload();
                        });
                    } else {
                        layer.msg("密码修改失败", {time: 2000});
                    }
                }
            })
        })


        //格式验证
        $("#nickName").blur(function () {
            var usernametest = /^\w{5,12}$/;
            var usernamevar = $("#nickName").val();
            if ($("#nickName").val() == null || $("#nickName").val() == "") {
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

        $("#old_password").blur(function () {
            if ($("#old_password").val() == null || $("#old_password").val() == "") {
                $("span[name=oldpwdMsg]").html("密码不能为空！");
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

        var walletmg = "<div class=\"change-pswd\" id='wallet-manage'>" +
            "                            <h2 class=\"hd-op\">充值金额</h2>" +
            "                            <form>" +
            "                                <div class=\"ch-pswd\">" +
            "                                    <input type=\"text\" disabled name=\"balance\" id='balance' placeholder=\"余额:\">" +
            "                                </div><!--ch-money end-->" +
            "                                <div class=\"ch-pswd\">" +
            "                                    <input type=\"text\" name=\"money\" id='money' placeholder=\"你想充值的金额\">" +
            "                                </div><!--ch-money end-->" +
            "                                <div class=\"ch-pswd\">" +
            "                                    <button type=\"button\" id=\"charge\"> 充值</button>" +
            "                                </div><!--ch-money end-->" +
            "                            </form>" +
            "                        </div><!--charge-money end-->" +
            "" +
            "                        <div class=\"change-pswd\" id='wallet-manage'>" +
            "                            <h2 class=\"hd-op\">购买会员</h2>" +
            "                            <form>" +
            "                                <div class=\"ch-pswd\">" +
            "                                    <input type=\"text\" disabled name=\"balance\" id=\"balance\" placeholder=\"余额: \">" +
            "                                </div><!--ch-vip end-->" +
            "                                <div class=\"ch-pswd\">" +
            "                                    <input type=\"text\" name=\"month\" id='month' placeholder=\"你想购买的月份\">" +
            "                                </div><!--ch-vip end-->" +
            "                                <div class=\"ch-pswd\">" +
            "                                    <button type=\"button\" id=\"purchase\"> 购买</button>" +
            "                                </div><!--ch-vip end-->" +
            "                            </form>" +
            "                        </div><!--change-vip end-->";
    $("#walletcharge").click(function () {
        $(".col-lg-9").children().remove();
        $(".col-lg-9").append(walletmg);
        $("#balance").attr("placeholder",<%=balance%>);
        $("#charge").click(function () {
            var money = $("#money").val();
            $.ajax({
                url: "http://localhost:8080/mvideo/UserServlet",
                type: "POST",
                data: {
                    action: "payMoney",
                    money:money
                },
                dataType: "text",
                success: function (data) {
                    if ("ok"==data){
                        window.alert("充值成功");
                        $("#balance").attr("value",${requestScope.user.wallet})
                    }else{
                        window.alert("充值失败")
                    }
                }
            })
        })
        $("#purchase").click(function () {
            console.log($("#purchase")[0]);
            $.ajax({
                url: "http://localhost:8080/mvideo/UserServlet",
                type: "POST",
                data: {
                    action: "payVip",
                    month:$("#month").val(),
                },
                dataType: "text",
                success: function (data) {
                    if ("ok"==data){
                        window.alert("购买成功");
                        $("#balance").attr("value",${requestScope.user.wallet})
                    }else{
                        window.alert("购买失败")
                    }
                }
            })
        })
    })
        $("#vippurchase").click(function () {
            $(".col-lg-9").children().remove();
            $(".col-lg-9").append(walletmg);
            $("#balance").attr("placeholder",<%=balance%>);
            $("#charge").click(function () {
                var money = $("#money").val();
                $.ajax({
                    url: "http://localhost:8080/mvideo/UserServlet",
                    type: "POST",
                    data: {
                        action: "payMoney",
                        money:money
                    },
                    dataType: "text",
                    success: function (data) {
                        if ("ok"==data){
                            window.alert("充值成功");
                            $("#balance").attr("value",${requestScope.user.wallet})
                        }else{
                            window.alert("充值失败")
                        }
                    }
                })
            })
            $("#purchase").click(function () {
                console.log($("#purchase")[0]);
                $.ajax({
                    url: "http://localhost:8080/mvideo/UserServlet",
                    type: "POST",
                    data: {
                        action: "payVip",
                        month:$("#month").val(),
                    },
                    dataType: "text",
                    success: function (data) {
                        if ("ok"==data){
                            window.alert("购买成功");
                            $("#balance").attr("value",${requestScope.user.wallet})
                        }else{
                            window.alert("购买失败")
                        }
                    }
                })
            })
        })

        $("#repassword").blur(function () {
            var passwordvar = $("#password").val();
            var repasswordvar = $("#repassword").val();
            if ($("#repassword").val() == null || $("#repassword").val() == "") {
                $("span[name=repwdMsg]").html("确认密码不能为空！");
            } else if (passwordvar != repasswordvar){
                $("span[name=repwdMsg]").html("密码不一致！");
            }
        });

    })

        //清除消息
        $("#nickName").focus(function () {
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
        $("#old_password").focus(function () {
            $("span[name=oldpwdMsg]").html("");
        })

</script>

</body>
</html>
