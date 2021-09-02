<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020-10-25
  Time: 16:33
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
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=managerVideoList"><i
                                        class="fa fa-circle-o"></i> 管理员上传视频</a></li>
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=userVideoList"><i
                                        class="fa fa-circle-o"></i> 用户上传视频</a></li>
                                <li><a href="http://localhost:8080/mvideo/VideoServlet?action=reviewList"><i
                                        class="fa fa-circle-o"></i> 视频审核</a></li>
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
                管理员上传视频
                <small>全部记录</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">Tables</a></li>
                <li class="active">Data tables</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">列表</h3>
                            <button name="add" type="button" class="btn btn-primary" style="float:right;"
                                    data-toggle="modal" data-target="#uploadModal" value="">上传视频
                            </button>

                        </div>
                        <!-- /.box-header -->

                        <%--表格--%>
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>标题</th>
                                    <th>视频类型</th>
                                    <th>视频权限</th>
                                    <th>视频描述</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--获取请求数据managers，遍历打印到表格--%>
                                <c:forEach items="${ requestScope.videos }" var="video">
                                    <tr>
                                        <td>${video.id}</td>
                                        <td>${video.title}</td>
                                        <td>${video.category}</td>
                                        <td>${video.isVip == 0?'免费':'VIP' }</td>
                                        <td>${video.desc}</td>
                                        <td>
                                            <button name="update" type="button" class="btn btn-primary"
                                                    data-toggle="modal" data-target="#uploadModal" value="${video.id}">
                                                查看/修改
                                            </button>
                                            <button name="delete" type="button" class="btn btn-primary"
                                                    data-toggle="modal" data-target="#delModal" value="${video.id}">删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>标题</th>
                                    <th>视频类型</th>
                                    <th>视频权限</th>
                                    <th>视频描述</th>
                                    <th>操作</th>
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

    <!-- 删除模态框（Modal） -->
    <div class="modal fade" id="delModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">提示</h4>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="del" type="button" class="btn btn-primary" value="">确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- 清空模态框（Modal） -->
    <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">编辑</h4>
                </div>
                <div class="modal-body">
                    <form id="form" action="UploadServlet"
                          method="post" enctype="multipart/form-data">
                        <input type="hidden" id="id" name="id" value=""/>
                        <div class="form-group">
                            <label for="title">视频标题</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="title"
                                   value="" required>
                        </div>
                        <div class="form-group">
                            <label for="type">视频类型</label>
                            <select class="form-control" id="type" name="type" required>
                                <%--获取请求数据roles，填充下拉列表--%>
                                <c:forEach items="${ requestScope.videoTypes }" var="type">
                                    <option value="${type.id}">${ type.category }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="isVip">视频权限</label>
                            <select class="form-control" id="isVip" name="isVip" required>
                                <option value="0">免费</option>
                                <option value="1">VIP</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="desc">视频描述</label>
                            <input type="text" class="form-control" id="desc" name="desc" placeholder="desc"
                                   value="">
                        </div>
                        <div class="form-group">
                            <label for="urltext">上传视频</label>
                            <input type="text" class="form-control" id="urltext" name="urltext" placeholder="desc"
                                   value="" readonly>
                            <input type="file" id="url" name="url" class="hidden"/>
                        </div>
                        <div class="form-group">
                            <label for="coverPic">封面图片</label><br>
                            <input type="text" id="coverPictext" name="coverPictext" placeholder="desc"
                                   value="" hidden>
                            <img id="browse" src="static/images/resources/vide1.png"
                                 style="max-height: 180px;max-width: 240px;">
                            <input type="file" id="coverPic" name="coverPic" class="hidden"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="update" type="button" class="btn btn-primary" value="">确认</button>
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
    $(function () {
        //模态框居中代码
        $(".modal").on('show.bs.modal', function () {
            // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零
            $(this).css('display', 'block');
            var modalHeight = $(window).height() / 2 - $(this).find(".modal-dialog").height() / 2;
            $(this).find('.modal-dialog').css({
                'margin-top': modalHeight
            });
        });

        //删除按钮绑定
        $("[name=delete]").click(function () {
            //获取管理员名
            var name = $(this).parents("tr").children().eq(1).html();
            $("#delModal").find(".modal-body").html("确认删除视频'" + name + "'?");
            //将管理员id传进模态框
            $("#del").val($(this).val());
        })

        //模态框删除按钮绑定
        $("#del").click(function () {
            var id = $(this).val();
            //删除用户
            $.ajax({
                url: "http://localhost:8080/mvideo/VideoServlet",
                type: "POST",
                data: {
                    action: "videodel",
                    del: 1,
                    id: id
                },
                dataType: "text",
                success: function (data) {
                    if (data == "ok") {
                        layer.msg("删除成功", {time: 2000}, function () {
                            location.href = "http://localhost:8080/mvideo/VideoServlet?action=managerVideoList";
                        });
                    }
                }
            })
        })

        //修改按钮绑定
        $("[name=update]").click(function () {
            var id = $(this).val();
            $.getJSON("http://localhost:8080/mvideo/VideoServlet", "action=getVideo&id=" + id, function (data) {
                $("#id").val(data.id);
                $("#title").val(data.title);
                $("#type").val(data.type);
                $("#isVip").val(data.isVip);
                $("#desc").val(data.desc);
                $("#urltext").val(data.url);
                $('#coverPictext').val(data.coverPic);
                $("#browse").attr('src', data.coverPic);
            })
        })

        //添加按钮绑定
        $("[name=add]").click(function () {
            $("#id").val("");
            $("#title").val("");
            $("#type").val("");
            $("#isVip").val("");
            $("#desc").val("");
            $("#urltext").val("");
            $('#coverPictext').val("");
            $("#browse").attr('src', "static/images/resources/vide1.png");
        })

        //修改（添加）按钮事件绑定
        $("#update").click(function () {
            var formData = new FormData($("#form")[0]);
            //获取属性值
            var id = $("#id").val()
            //声明action，默认为修改
            var action = 'manageUpdate';
            //如果id为空，则为添加方法
            if (id == '') {
                action = 'manageUpload';
            }
            //验证账号密码
            $.ajax({
                url: "http://localhost:8080/mvideo/UploadServlet?action=" + action,
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data == "ok") {
                        layer.msg("编辑成功", {time: 2000}, function () {
                            location.href = "http://localhost:8080/mvideo/VideoServlet?action=managerVideoList";
                        });
                    } else if (data == "error") {
                    }
                }
            })
        })


        //点击browse选择文件
        $("#browse").click(function () {
            $('#coverPic').click();
        });

        //点击urltext选择文件
        $("#urltext").click(function () {
            $('#url').click();
        });

        //检查图片格式，预览图片
        $('#coverPic').change(function () {
            //判断图片格式
            var fileName = this.value;
            var suffixIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substring(suffixIndex + 1).toUpperCase();
            if (suffix != "JPG" && suffix != "PNG") {
                alert("请上传png、jpg格式图片!");
                return;
            }
            //解决C:\fakepath问题
            var oFReader = new FileReader();
            var file = this.files[0];
            oFReader.readAsDataURL(file);
            oFReader.onloadend = function (oFRevent) {
                var src = oFRevent.target.result;
                //预览图片
                $('#browse').attr('src', src);
                $('#coverPictext').val(src);
            }
        });

        //检查视频格式
        $('#url').change(function () {
            //判断图片格式
            var fileName = this.value;
            var suffixIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substring(suffixIndex + 1).toUpperCase();
            if (suffix != "MP4") {
                alert("请上传MP4格式视频!");
                return;
            }
            //解决C:\fakepath问题
            $('#urltext').val(fileName);
        });

        //表格加载（自动实现查询，分页等功能）
        $("#example1").DataTable({
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sInfo": "从 _START_ 到 _END_ /共_TOTAL_条数据",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "尾页"
                }
            }
        });
    })
</script>
</body>
</html>