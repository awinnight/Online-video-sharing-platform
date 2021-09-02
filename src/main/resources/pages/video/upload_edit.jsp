<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Oren Video Template</title>
    <%-- 静态包含 base 标签 --%>
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
                            <button type="submit" id="searchbtn">
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
                                        <li><a href="Upload_Video.html" title="">Upload Video Page</a></li>
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
                                        <li><a href="History_Page.html" title="">History page</a></li>
                                        <li><a href="Browse_Categories.html" title="">Browse Categories Page</a></li>
                                        <li><a href="Updates_From_Subs.html" title="">Updates from subscription page</a>
                                        </li>
                                        <li><a href="login.html" title="">login page</a></li>
                                        <li><a href="signup.html" title="">signup page</a></li>
                                        <li><a href="User_Account_Page.html" title="">User account page</a></li>
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


    <section class="vid-title-sec">
        <div class="container">
            <form action="UploadServlet?action=upload"
                  method="post" enctype="multipart/form-data">

                <div class="vid-title">
                    <h3> 选择视频封面</h3>
                    <div class="vid_thumbainl tr">
                        <img id="browse" src="static/images/resources/vide1.png"
                             style="max-height: 180px;max-width: 240px;">
                        <input id="img-upload" name="coverPic" type="file" hidden/>
                    </div><!--vid_thumbnail tr end-->
                    <div style="text-align: center">
                        <h3>选择要上传的视频文件 </h3>
                        <%--                    <i class="icon-tick"></i>--%>
                        <div class="btn-sbmit">
                            <button type="button"><label id="label" for="video-upload" class="custom-file-upload">上传视频
                            </label></button>
                        </div><!--btn-sbmit end-->
                        <input id="video-upload" name="url" type="file" hidden/>
                    </div>
                </div>
                <br>
                <div class="vid-vidz-pr">
                    <h1 class="title-hd">标题 </h1>
                    <div class="form_field">
                        <input type="text" name="title" placeholder="Add here (99 characters remaining)">
                    </div>
                </div><!--vid-title-->
                <div class="abt-vidz-pr">
                    <h2 class="title-hd"> 视频描述 </h2>
                    <div class="form_field">
                        <textarea name="desc" placeholder="Description"></textarea>
                    </div>
                </div><!--abt-vidz-->

                <div class="category">
                    <h2 class="title-hd">视频类型</h2>
                    <div class="category-typ">
                        <ul class="catgss_list">
                            <li>
                                <div class="chekbox-lg">
                                    <label>
                                        <input type="radio" name="isVip" value="0">
                                        <b class="checkmark"></b>
                                        <span>免费</span>
                                    </label>
                                </div>
                            </li>

                            <li>
                                <div class="chekbox-lg">
                                    <label>
                                        <input type="radio" name="isVip" value="1">
                                        <b class="checkmark"></b>
                                        <span>VIP</span>
                                    </label>
                                </div>
                            </li>

                        </ul>
                    </div><!--category-typ-->
                </div><!--Category-->

                <div class="category">
                    <h2 class="title-hd">标签</h2>
                    <div class="category-typ">
                        <ul class="catgss_list">
                            <c:forEach items="${ requestScope.videoTypes }" var="type">
                                <li>
                                    <div class="chekbox-lg">
                                        <label>
                                            <input type="radio" name="type" value="${ type.id }">
                                            <b class="checkmark"></b>
                                            <span>${ type.category }</span>
                                        </label>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="clearfix"></div>
                        <div class="btn-sbmit">
                            <button type="submit">上传</button>
                        </div><!--btn-sbmit end-->
                    </div><!--category-typ-->
                </div><!--Category-->
            </form>
        </div>
    </section><!--vid-title-sec-->


    <footer>
        <div class="container">
            <div class="top-footer">
                <div class="row">
                </div>
            </div><!--top-footer end-->
            <div class="bottom-strip">
                <p>© azyrusthemes <i class="icon-like"></i> Made in India</p>
                <ul class="social-links">
                    <li><a href="#" title=""><i class="icon-facebook-official"></i></a></li>
                    <li><a href="#" title=""><i class="icon-twitter"></i></a></li>
                    <li><a href="#" title=""><i class="icon-instagram"></i></a></li>
                </ul>
                <div class="clearfix"></div>
            </div><!--bottom-strip end-->
        </div>
    </footer><!--footer end-->


</div><!--wrapper end-->


<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="static/js/script.js"></script>
<script>
    $(function () {
        //点击browse选择文件
        $("#browse").click(function () {
            $('#img-upload').click();
        });

        //检查图片格式，预览图片
        $('#img-upload').change(function () {
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
            }
        });

        //检查视频格式
        $('#video-upload').change(function () {
            //判断图片格式
            var fileName = this.value;
            var suffixIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substring(suffixIndex + 1).toUpperCase();
            if (suffix != "MP4" && suffix != "AVI" && suffix != "rmvb") {
                alert("请上传MP4、avi、rmvb格式视频!");
                $("#label").html("上传视频");
                return;
            } else {
                $("#label").html("<i class=\"icon-tick\"></i>");
            }
        });


    })
</script>


</body>
</html>