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

            <%--????????????--%>
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
                                    <a href="#" class="btn btn-default btn-flat">????????????</a>
                                </div>
                                <div class="pull-right">
                                    <a href="LogoutServlet?action=managerLogout" class="btn btn-default btn-flat">??????</a>
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
            <!-- ??????????????????????????? -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="static2/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${ sessionScope.manager.nickName }</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <!-- ??????????????? : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">MAIN NAVIGATION</li>
                <li class="treeview">
                    <a href="http://localhost:8080/mvideo/ManagerServlet?action=list">
                        <i class="fa fa-dashboard"></i> <span>??????</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-pie-chart"></i>
                        <span>????????????</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="http://localhost:8080/mvideo/ManagerServlet?action=list"><i class="fa fa-circle-o"></i> ???????????????</a></li>
                        <li><a href="http://localhost:8080/mvideo/UserServlet?action=list"><i class="fa fa-circle-o"></i> ????????????</a></li>
                        <li><a href="http://localhost:8080/mvideo/RoleServlet?action=list"><i class="fa fa-circle-o"></i> ????????????</a></li>
                        <li><a href="http://localhost:8080/mvideo/VideoTypeServlet?action=list"><i class="fa fa-circle-o"></i> ????????????</a></li>
                        <li><a href="http://localhost:8080/mvideo/PermissionServlet?action=list"><i class="fa fa-circle-o"></i> ????????????</a></li>
                        <li><a href="http://localhost:8080/mvideo/LogServlet?action=list"><i class="fa fa-circle-o"></i> ????????????</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>??????</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="#"><i class="fa fa-circle-o"></i> ????????????
                                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=managerVideoList"><i class="fa fa-circle-o"></i> ?????????????????????</a></li>
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=userVideoList"><i class="fa fa-circle-o"></i> ??????????????????</a></li>
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=reviewList"><i class="fa fa-circle-o"></i> ????????????</a></li>
                            </ul>
                        </li>
                        <li><a href="http://localhost:8080/mvideo/OrderServlet?action=list"><i class="fa fa-circle-o"></i> ????????????</a></li>
                        <li><a href="http://localhost:8080/mvideo/AdvertServlet?action=list"><i class="fa fa-circle-o"></i> ??????????????????</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.????????? -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                ????????????
                <small>????????????</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> ??????</a></li>
                <li><a href="#">????????????</a></li>
                <li class="active">????????????</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">??????</h3>

                        </div>
                        <!-- /.box-header -->

                        <%--??????--%>
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>?????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--??????????????????managers????????????????????????--%>
                                <c:forEach items="${ requestScope.orders }" var="user">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.nickName}</td>
                                        <td>${user.orderDate}</td>
                                        <td>${user.notes}</td>
                                        <td>${user.amount}</td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>?????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                    <th>????????????</th>
                                </tr>

                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
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

    <!-- /.modal -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

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
<!-- page script -->
<script>
    $(function () {
        //??????????????????????????????????????????????????????
        $("#example1").DataTable({
            "oLanguage": {
                "sLengthMenu": "???????????? _MENU_ ?????????",
                "sInfo": "??? _START_ ??? _END_ /???_TOTAL_?????????",
                "oPaginate": {
                    "sFirst": "??????",
                    "sPrevious": "?????????",
                    "sNext": "?????????",
                    "sLast": "??????"
                }
            }
        });
    })

</script>
</body>
</html>
