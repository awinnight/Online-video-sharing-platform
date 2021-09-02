<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" type="text/css" href="static/css/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello.css">
    <link rel="stylesheet" type="text/css" href="static/css/fontello-codes.css">
    <link rel="stylesheet" type="text/css" href="static/css/thumbs-embedded.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="static/css/color.css">

</head>


<body>


<div class="wrapper hp_1">

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
                                        <li><a href="HistoryServlet?action=queryVipVideoHistory&pagesize=8&pageno=1" title="">History
                                            page</a></li>
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
                                        onclick="window.location.href='HistoryServlet?action=queryVipVideoHistory&pagesize=8&pageno=1'">
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
    <c:if test="${ empty sessionScope.user }">
    <section class="banner-section">
        <div class="container">
            <div class="banner-text">
                <h2>Watch share and upload with friends</h2>
                <a href="pages/user/login.jsp" title="">登陆/创建我的账号</a>
            </div><!--banner-text end-->
            <h3 class="headline">Video of the Day by <a href="#" title="">newfox media</a></h3>
        </div>
    </section>
    <!--banner-section end-->

    </c:if>
    <section class="vds-main">

        <div class="vidz-row">
            <div class="container">
                <div class="vidz_list m-0">
                    <div class="row">
                        <c:forEach items="${requestScope.page.items}" var="video">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                <div class="videoo">
                                    <div class="vid_thumbainl">
                                        <a href=pages/video/singlevideopage.jsp?uploaderid=${video.uploaderId}&videoid=${video.id}&author=${video.nickName} title="">
                                            <img src="${video.coverPic}" alt="" style="width: 270px;height: 170px;">
                                            <span class="vid-time">29:32</span>
                                            <span class="watch_later">
												<i class="glyphicon-star-empty"></i>
											</span>
                                        </a>
                                    </div><!--vid_thumbnail end-->
                                    <div class="video_info">
                                        <h3>  <a href=pages/video/singlevideopage.jsp?uploaderid=${video.uploaderId}&videoid=${video.id}&author=${video.nickName} title="">${video.title}</a></h3>
                                        <h4><a href="pages/video/singlechannel.jsp?" title="">${video.nickName}</a></h4>
                                        <span>${video.viewed}次观看 .<small class="posted_dt">19 hours ago</small></span>
                                    </div>
                                </div><!--videoo end-->
                            </div>
                        </c:forEach>
                        <div id="page_nav">
                            <%--大于首页，才显示--%>
                            <c:if test="${requestScope.page.pageNo > 1}">
                                <a href="VideoServlet?action=queryVipVideo&pageno=1&pagesize=8&type=${requestScope.type}&search=${requestScope.search}">首页</a>
                                <a href="VideoServlet?action=queryVipVideo&pageno=${requestScope.page.pageNo-1}&pagesize=8&type=${requestScope.type}&search=${requestScope.search}">上一页</a>
                            </c:if>
                            <%--页码输出的开始--%>
                            <c:choose>
                                <%--情况1：如果总页码小于等于5 的情况，页码的范围是：1-总页码--%>
                                <c:when test="${ requestScope.page.pageTotal <= 5 }">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                                </c:when>
                                <%--情况2：总页码大于5 的情况--%>
                                <c:when test="${requestScope.page.pageTotal > 5}">
                                    <c:choose>
                                        <%--小情况1：当前页码为前面3 个：1，2，3 的情况，页码范围是：1-5.--%>
                                        <c:when test="${requestScope.page.pageNo <= 3}">
                                            <c:set var="begin" value="1"/>
                                            <c:set var="end" value="5"/>
                                        </c:when>
                                        <%--小情况2：当前页码为最后3 个，8，9，10，页码范围是：总页码减4 - 总页码--%>
                                        <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                                            <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                                            <c:set var="end" value="${requestScope.page.pageTotal}"/>
                                        </c:when>
                                        <%--小情况3：4，5，6，7，页码范围是：当前页码减2 - 当前页码加2--%>
                                        <c:otherwise>
                                            <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                                            <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                            <c:forEach begin="${begin}" end="${end}" var="i">
                                <c:if test="${i == requestScope.page.pageNo}">
                                    【${i}】
                                </c:if>
                                <c:if test="${i != requestScope.page.pageNo}">
                                    <a href="VideoServlet?action=queryVipVideo&pageno=${i}&pagesize=8&type=${requestScope.type}&search=${requestScope.search}">${i} </a>
                                </c:if>
                            </c:forEach>
                            <%--页码输出的结束--%>
                            <%-- 如果已经 是最后一页，则不显示下一页，末页 --%>
                            <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
                                <a href="VideoServlet?action=queryVipVideo&pageno=${requestScope.page.pageNo+1}&pagesize=8&type=${requestScope.type}&search=${requestScope.search}">下一页</a>
                                <a href="VideoServlet?action=queryVipVideo&pageno=${requestScope.page.pageTotal}&pagesize=8&type=${requestScope.type}&search=${requestScope.search}">末页</a>
                            </c:if>
                            共${ requestScope.page.pageTotal }页，${ requestScope.page.pageTotalCount }条记录
                            到第<input value="${param.pageNo}" name="pn" id="pn_input"/>页
                            <input id="searchPageBtn" type="button" value="确定">
                            <script type="text/javascript">
                                $(function () {
                                    // 跳到指定的页码
                                    $("#searchPageBtn").click(function () {
                                        var pageNo = $("#pn_input").val();
                                        <%--var pageTotal = ${requestScope.page.pageTotal};--%>
                                        <%--alert(pageTotal);--%>
                                        // javaScript 语言中提供了一个 location 地址栏对象
                                        // 它有一个属性叫href .它可以获取浏览器地址栏中的地址
                                        // href 属性可读，可写
                                        location.href = "VideoServlet?action=queryVipVideo&pagesize=8&type=${requestScope.type}&search=${requestScope.search}$pageno=" +
                                            pageNo;
                                    });
                                });
                            </script>
                        </div>
                    </div>
                </div><!--vidz_list end-->
            </div>
        </div><!--vidz-row end-->
    </section>

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

</body>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="static/js/flatpickr.js"></script>
<script src="static/js/script.js"></script>
<script>
    $(function () {
        $("#searchbtn").click(function () {
            var search = $("#search").val();
            window.location.href = "http://localhost:8080/mvideo/VideoServlet?action=queryVipVideo&pageno=1&pagesize=8&type=title&search=" + search;
        })
    })

</script>
</html>
