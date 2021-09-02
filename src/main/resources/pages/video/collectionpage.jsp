<%--
  Created by IntelliJ IDEA.
  User: ikutarian
  Date: 2020/10/18
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
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
    </header><!--header end-->


    <section class="ab-collection">
        <div class="collection-lst">
            <div class="container">
                <div class="collection-hd-head">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="watch_collection_tab" data-toggle="tab" href="#watch_collection"
                               role="tab" aria-controls="watch_collection_tab" aria-selected="true">我的收藏</a>
                        </li>
                    </ul><!--nav-tabs end-->
                    <a href="#" title="" class="clear-collection">
                        <i class="icon-cancel"></i>
                        Clear all search collection
                    </a>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="watch_collection" role="tabpanel"
                     aria-labelledby="watch_collection_tab">
                    <div class="tabs_lzt">
                        <c:forEach items="${requestScope.page.items}" var="collection">
                            <div class="tab-collection">
                                <div class="videoo">
                                    <div class="vid_thumbainl ms">
                                        <a href=pages/video/singlevideopage.jsp?uploaderid=${collection.uploaderId}&videoid=${collection.id} title="">
                                            <img src="${collection.coverPic}" alt="">
                                            <span class="vid-time">10:21</span>
                                            <span class="watch_later">
							<i class="icon-watch_later_fill"></i>
						</span>
                                        </a>
                                    </div>
                                    <!--vid_thumbnail end-->
                                    <div class="video_info ms">
                                        <h3><a href=pages/video/singlevideopage.jsp?uploaderid=${collection.uploaderId}&videoid=${collection.id} title="">${collection.title}</a></h3>
                                        <h4><a href="Single_Channel_Playlist.html" title="">${collection.nickName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                        <span>${collection.viewed}次观看 .<small class="posted_dt">1 week ago</small></span>
                                    </div>
                                    <a href="javascript:void(0);" title="" class="delete-video" id="dele${collection.id}">
                                        <i class="icon-cancel"></i>
                                    </a>
                                    <div class="clearfix"></div>
                                </div>
                                <!--videoo end-->
                            </div>
                            <!--tab-collection end-->



                        </c:forEach>

                    </div><!--tabs_lz end-->
                </div>
                <div class="tab-pane fade" id="search_collection" role="tabpanel" aria-labelledby="search_collection_tab">
                    <div class="tabs_lzt">

                    </div><!--tabs_lz end-->
                </div>
            </div>
        </div>
    </section><!--ab-collection end-->

    <section class="more_items_sec text-center">
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

<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="static/js/script.js"></script>

<script>
    $(function () {
        $("#searchbtn").click(function () {
            var search = $("#search").val();
            window.location.href =  "http://localhost:8080/mvideo/VideoServlet?action=page&pageno=1&pagesize=8&type=title&search="+search;
        })
        $(".delete-video").click(this,function () {
            var videoid= this.id;
            console.log(this);
            console.log(videoid)
            console.log($(this).parents(".tab-collection")[0])
            $(this).parents(".tab-collection").remove();
            $.ajax({
                url: "http://localhost:8080/mvideo/CollectionServlet",
                type: "POST",
                data: {
                    action: "delete",
                    videoid: videoid,
                },
                dataType: "text",
                success: function (data) {
                    if (data == "success") {
                        $(this).parents(".tab-collection").remove();
                    } else if (data == "error") {
                        window.alert("删除失败");
                    }
                }
            })
        })
    })
</script>

</body>
</html>
