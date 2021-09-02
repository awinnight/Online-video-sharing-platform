<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020-10-25
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Data Tables</title>
    <%@ include file="../common/head.jsp" %>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="static2/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="static2/dist/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="static2/dist/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="static2/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="static2/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="static2/dist/css/skins/all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery 2.2.3 -->
    <script src="static2/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="static2/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="static2/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="static2/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="static2/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="static2/plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="static2/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="static2/dist/js/demo.js"></script>
    <script src="static/js/layer/layer.js"></script>
    <!-- page script -->
    <script>
        $(window).load(function(){
            $.ajaxSettings.async = false;
            $.getJSON("http://localhost:8080/mvideo/VideoServlet", "action=getVideo&id=" + ${ param.id }, function (data) {
                $("#id").val("${ param.id }");
                $("#title").val(data.title);
                $("#type").val("${ param.category }");
                $("#isVip").val(data.title = 0?"免费":"VIP");
                $("#pic").val(data.coverPic);
                $("#coverPic").attr("src",data.coverPic);
                $("#nickName").val("${ param.nickName }");
                $("#uploadTime").val(data.uploadTime);
                $("#desc").val(data.desc);
                $("#video").val(data.url);
                var sourceDom = $("<source src=\""+ data.url +"\">");
                $("video").append(sourceDom);
            })
        });
        $(function () {
            $("#return").click(function () {
                location.href = "http://localhost:8080/mvideo/VideoServlet?action=userVideoList";
            })

            $("#off").click(function () {
                //审核不通过
                $.ajax({
                    url: "http://localhost:8080/mvideo/VideoServlet",
                    type: "POST",
                    data: {
                        action: "reviewVideo",
                        flag: 0,
                        id: $("#id").val()
                    },
                    dataType: "text",
                    success: function (data) {
                        if (data == "ok2") {
                            layer.msg("审核不通过", {time: 2000}, function () {
                                location.href = "http://localhost:8080/mvideo/VideoServlet?action=reviewList";
                            });
                        }
                    }
                })
            })

            $("#up").click(function () {
                //审核通过
                $.ajax({
                    url: "http://localhost:8080/mvideo/VideoServlet",
                    type: "POST",
                    data: {
                        action: "reviewVideo",
                        flag: 1,
                        id: $("#id").val()
                    },
                    dataType: "text",
                    success: function (data) {
                        if (data == "ok") {
                            layer.msg("审核通过", {time: 2000}, function () {
                                location.href = "http://localhost:8080/mvideo/VideoServlet?action=reviewList";
                            });
                        }
                    }
                })
            })

        })
    </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="../../index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Admin</b>LTE</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <%--用户菜单--%>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">\,
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="static2/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${ sessionScope.manager.nickName }</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="static2/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    ${ sessionScope.manager.nickName }
                                    <small>Web Developer</small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">个人资料</a>
                                </div>
                                <div class="pull-right">
                                    <a href="LogoutServlet?action=managerLogout" class="btn btn-default btn-flat">登出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- 个人账号（右上角） -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="static2/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${ sessionScope.manager.nickName }</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <!-- 左侧菜单栏 : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">MAIN NAVIGATION</li>
                <li class="treeview">
                    <a href="http://localhost:8080/mvideo/ManagerServlet?action=list">
                        <i class="fa fa-dashboard"></i> <span>首页</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-pie-chart"></i>
                        <span>系统管理</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="http://localhost:8080/mvideo/ManagerServlet?action=list"><i
                                class="fa fa-circle-o"></i> 管理员管理</a></li>
                        <li><a href="http://localhost:8080/mvideo/UserServlet?action=list"><i
                                class="fa fa-circle-o"></i> 用户管理</a></li>
                        <li><a href="http://localhost:8080/mvideo/RoleServlet?action=list"><i
                                class="fa fa-circle-o"></i> 角色管理</a></li>
                        <li><a href="http://localhost:8080/mvideo/VideoTypeServlet?action=list"><i
                                class="fa fa-circle-o"></i> 分类管理</a></li>
                        <li><a href="http://localhost:8080/mvideo/PermissionServlet?action=list"><i
                                class="fa fa-circle-o"></i> 权限管理</a></li>
                        <li><a href="http://localhost:8080/mvideo/LogServlet?action=list"><i class="fa fa-circle-o"></i>
                            日志管理</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>工作</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="#"><i class="fa fa-circle-o"></i> 视频管理
                                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=managerVideoList"><i class="fa fa-circle-o"></i> 管理员上传视频</a></li>
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=userVideoList"><i class="fa fa-circle-o"></i> 用户上传视频</a></li>
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=reviewList"><i class="fa fa-circle-o"></i> 视频审核</a></li>
                            </ul>
                        </li>
                        <li><a href="http://localhost:8080/mvideo/OrderServlet?action=list"><i
                                class="fa fa-circle-o"></i> 订单管理</a></li>
                        <li><a href="http://localhost:8080/mvideo/AdvertServlet?action=list"><i
                                class="fa fa-circle-o"></i> 友情链接管理</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.菜单栏 -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                视频详情<br><br>
                <button id="return" type="button" class="btn btn-primary" style="float:none;"
                        data-toggle="modal" data-target="#uploadModal" value="">&nbsp;&nbsp;返回&nbsp;&nbsp;
                </button>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">Tables</a></li>
                <li class="active">Data tables</li>
            </ol>
            <!-- /.box-header -->


            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <input type="hidden" class="form-control" id="id" name="id">
                        <div class="form-group">
                            <label>标题</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>视频类型</label>
                            <input type="text" class="form-control" id="type" name="type" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>视频权限</label>
                            <input type="text" class="form-control" id="isVip" name="isVip" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>封面链接</label>
                            <input type="text" class="form-control" id="pic" name="pic" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>封面</label><br><br><br>
                            <img id="coverPic" src="static/images/resources/vide1.png" style="width: 500px;height: 300px;">
                        </div>
                        <!-- /.form-group -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>上传者</label>
                            <input type="text" class="form-control" id="nickName" name="nickName" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>上传时间</label>
                            <input type="text" class="form-control" id="uploadTime" name="uploadTime" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>视频描述</label>
                            <input type="text" class="form-control" id="desc" name="desc" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>视频链接</label>
                            <input type="text" class="form-control" id="video" name="video" placeholder="title"
                                   value="" readonly>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label>视频</label><br>
                            <video
                                    id="my-video"
                                    class="video-js"
                                    controls="controls"
                                    preload="auto"
                                    width="550"
                                    height="350"
                                    data-setup="{}"
                            >

                            </video>
                        </div>
                        <!-- /.form-group -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><br><br>
            <c:if test="${ not empty param.review }">
                <div id="review" style="text-align: center">
                    <button id="off" type="button" class="btn btn-primary"
                            data-toggle="modal" data-target="#uploadModal" value="">审核不通过
                    </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="up" type="button" class="btn btn-primary"
                            data-toggle="modal" data-target="#uploadModal" value="">&nbsp;&nbsp;确认上传&nbsp;&nbsp;
                    </button>
                </div>
            </c:if>

        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.8
        </div>
        <strong>Copyright &copy; 2019-2021 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
        reserved.
    </footer>

    <!-- 删除模态框（Modal） -->
    <div class="modal fade" id="delModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="d" name="d" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="del" type="button" class="btn btn-primary" value="">确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

    <!-- /.modal -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>
</html>
