<%@ page import="entity.Video" %>
<%@ page import="service.impl.VideoServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: ikutarian
  Date: 2020/10/20
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Video video = new VideoServiceImpl().queryVideoById(request.getParameter("videoid")); request.setAttribute("videoid",video.getId());
    String author = request.getParameter("author");
%>
<html>
<head>
    <meta charset="UTF-8">
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
    <title>视频详情页</title>

</head>
<body>

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

</header>

<section class="mn-sec">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="mn-vid-sc single_video">

                    <div class="vid-1">
                        <div class="vid-pr">

                            <video
                                    id="my-video"
                                    class="video-js"
                                    controls
                                    preload="auto"
                                    width="640"
                                    height="264"
                                    poster=<%=video.getCoverPic()%>
                                    data-setup="{}"
                            >
                            <%--   根据servlet返回的名称填入视频文件名            singlevideo?video=a                   --%>
                                <source src=<%=video.getUrl()%> type="video/mp4" id="src1"/>

                            </video>
                        </div><!--vid-pr end-->
                        <div class="vid-info">
                            <h3 id="video_title"><%=video.getTitle()%></h3>
                            <div class="info-pr">
                                <span id="video_views"><%=video.getViewed()%>次观看</span>
                                <div class="clearfix"></div>
                            </div><!--info-pr end-->
                        </div><!--vid-info end-->
                    </div><!--vid-1 end-->
                    <div class="abt-mk">
                        <div class="info-pr-sec">
                            <div class="vcp_inf cr">
                                <div class="vc_hd">
                                    <img src="static/images/resources/th5.png" alt="">
                                </div>
                                <div class="vc_info pr">
                                    <h4><a href="#" title=""><%=author%></a></h4>
                                    <span>上传于<%=video.getUploadTime()%></span>
                                </div>
                            </div><!--vcp_inf end-->
                            <ul class="chan_cantrz">
                                <li>
                                    <a href="#" title="" class="subscribe">Subscribe <strong>13M</strong></a>
                                </li>
                            </ul><!--chan_cantrz end-->
                            <ul class="df-list">
                                <li>
                                    <button data-toggle="tooltip" data-placement="top" title="Favorite" id="favor${videoid}">
                                        <i class="icon-like"></i>
                                    </button>
                                </li>
                            </ul><!--df-list end-->
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="about-ch-sec">
                            <div class="abt-rw">
                                <h4>Cast:</h4>
                                <ul>
                                    <li><span>Nathan Drake</span></li>
                                    <li><span>Victor Sullivan </span></li>
                                    <li><span>Sam Drake </span></li>
                                    <li><span>Elena Fisher</span></li>
                                </ul>
                            </div>
                            <div class="abt-rw">
                                <h4>Category : </h4>
                                <ul>
                                </ul>
                            </div>
                            <div class="abt-rw">
                                <h4>About : </h4>
                                <p><%=video.getDesc()%></p>
                            </div>
                            <div class="abt-rw tgs">
                                <h4>Tags : </h4>
                                <ul>
                                    <li><a href="#" title="">#Kingdom</a></li>
                                    <li><a href="#" title="">#ImStillHereBecause </a></li>
                                    <li><a href="#" title="">#denim</a></li>
                                    <li><a href="#" title="">#tshirt</a></li>
                                </ul>
                            </div>
                        </div><!--about-ch-sec end-->
                    </div><!--abt-mk end-->
                    <div class="amazon">
                        <div class="abt-amz">
                            <div class="amz-hd">
                                <h2>Products used in this video </h2>
                                <h3>Use CODE:<span> ScereBro26</span> 10% Discount</h3>
                            </div><!--amz-hd end-->
                            <div class="amz-lg">
                                <img src="static/images/resources/cp-logo.png" alt="">
                            </div><!--amz-lg end-->
                            <div class="clearfix"></div>
                        </div><!--abt-amz end-->
                        <div class="amz-img-inf">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                    <div class="mg-inf">
                                        <div class="img-sr">
                                            <a href="#" title="">
                                                <img src="static/images/resources/pro1.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info-sr">
                                            <h3><a href="#" title="">HEMOON Men’s casual sportswear..</a></h3>
                                            <span>$32.99</span>
                                        </div>
                                    </div><!--mg-inf end-->
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                    <div class="mg-inf">
                                        <div class="img-sr">
                                            <a href="#" title="">
                                                <img src="static/images/resources/pro2.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info-sr">
                                            <h3><a href="#" title=""> Men's Insulated Front-Zip Jacket </a></h3>
                                            <span class="pr-d">$34.90</span>
                                        </div>
                                    </div><!--mg-inf end-->
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                    <div class="mg-inf">
                                        <div class="img-sr">
                                            <a href="#" title="">
                                                <img src="static/images/resources/pro3.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info-sr">
                                            <h3><a href="#" title="">Dickies Men's Sanded Duck Jacket </a></h3>
                                            <span class="pr-d">$17.49</span>
                                        </div>
                                    </div><!--mg-inf end-->
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                    <div class="mg-inf">
                                        <div class="img-sr">
                                            <a href="#" title="">
                                                <img src="static/images/resources/pro4.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info-sr">
                                            <h3><a href="#" title="">Men's Big-Tall Lined Eisenhower Jacket </a></h3>
                                            <span class="pr-d">$39.00</span>
                                        </div>
                                    </div><!--mg-inf end-->
                                </div>
                            </div>
                        </div><!--amz-img-in-->
                    </div><!--amazon end-->
                    <div class="cmt-bx">
                        <ul class="cmt-pr">
                            <li><span>18,386</span> Comments</li>
                            <li>
                                <span><i class="icon-sort_by"></i><a href="#" title="">Sort By</a></span>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        <div class="clearfix"></div>
                        <div class="vcp_inf pc">
                            <div class="vc_hd">
                                <img src="static/images/resources/th1.png" alt="">
                            </div>
                            <form>
                                <input type="text" placeholder="Add a public comment">
                                <button type="submit">Comment</button>
                            </form>
                            <div class="clearfix"></div>
                            <div class="rt-cmt">
                                <a href="#" title="">
                                    <i class="icon-cancel"></i>
                                </a>
                                <div class="clearfix"></div>
                            </div><!--vcp_inf end-->
                        </div><!--cmt-bx end-->
                        <ul class="cmn-lst">
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th2.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <div class="pinned-comment">
                                            <span><i class="icon-pinned"></i>Pinned by ScereBro</span>
                                        </div>
                                        <h2>ScereBro <small class="posted_dt"> . 18 hours ago</small></h2>
                                        <p>Where does Thor: Ragnarok rank amongst the other Thor movies? Amongst the
                                            rest of the MCU? Let us know in the comments below and tell us which other
                                            movies you'd like to see us make Honest.</p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>680</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span>21</span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 164 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th3.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Doge <small class="posted_dt"> . 2 hours ago</small></h2>
                                        <p>Depressive Alcoholics are my favorite superheroes </p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>61</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span>3</span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 26 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th4.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Juan Lacanaria <small class="posted_dt"> . 12 hours ago</small></h2>
                                        <p>Can you please say "winner winner , chicken dinner" </p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>22</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span></span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 9 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th5.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Comander Lucky <small class="posted_dt"> . 2 weeks ago</small></h2>
                                        <p>It looked like electro shuffle was most synced</p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>37</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span>3</span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 12 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th1.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Menji <small class="posted_dt"> . 1 week ago</small></h2>
                                        <p>The floss, fresh, flapper, ride the pony were all in sync if you ask me plus
                                            if they used the original music they would be copyrighted. Plus the original
                                            music made it worst for these dances. </p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>147</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span>8</span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 7 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th3.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Storax Storm <small class="posted_dt"> . 11 hours ago</small></h2>
                                        <p>Well Epic Games would have gotten Copyrighted if they used the original music
                                            but yea I see you</p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>71</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span>28</span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 21 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th2.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Nick Jacobs <small class="posted_dt"> . 6 hours ago</small></h2>
                                        <p>Electro shuffle best dance hands down </p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>42</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span></span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 32 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                            <li>
                                <div class="vcp_inf">
                                    <div class="vc_hd">
                                        <img src="static/images/resources/th4.png" alt="">
                                    </div>
                                    <div class="coments">
                                        <h2>Jumpman30 <small class="posted_dt"> . 2 hours ago</small></h2>
                                        <p>bruh okay the original fresh music is the best hands down, it looks classy.
                                            the music they put on the fresh in fort nite makes it worse </p>
                                        <ul class="cmn-i">
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_up"></i>
                                                </a>
                                                <span>48</span>
                                            </li>
                                            <li>
                                                <a href="#" title="">
                                                    <i class="icon-thumbs_down"></i>
                                                </a>
                                                <span>2</span>
                                            </li>
                                        </ul>
                                        <a href="#" title="">View all 3 replies</a>
                                    </div><!--coments end-->
                                </div><!--vcp_inf end-->
                            </li>
                        </ul><!--comment list end-->
                    </div>
                </div><!--mn-vid-sc end--->
            </div><!---col-lg-9 end-->
            <div class="col-lg-3">
                <div class="sidebar">
                    <div class="vidz-prt">
                        <h2 class="sm-vidz">Similar Videos</h2>
                        <h3 class="aut-vid">
                            <span>Autoplay </span>
                            <label class="switch">
                                <input type="checkbox">
                                <b class="slider round"></b>
                            </label>
                        </h3>
                        <div class="clearfix"></div>
                    </div><!--vidz-prt end-->
                    <div class="videoo-list-ab">
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide1.png" alt="">
                                    <span class="vid-time">10:21</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span><%=video.getViewed()%>次观看.<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide2.png" alt="">
                                    <span class="vid-time">13:49</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a>
                                </h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide3.png" alt="">
                                    <span class="vid-time">2:54</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="ad-rw">
                            <img src="static/images/resources/ad-img.jpg" alt="">
                        </div>
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide4.png" alt="">
                                    <span class="vid-time">5:25</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">Top 5 Amazing Bridge Block ever in PUBG</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide5.png" alt="">
                                    <span class="vid-time">4:01</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">Trailer Park Boys Season 12 - Official Trailer</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide6.png" alt="">
                                    <span class="vid-time">6:20</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">A day in the life of a Google software engineer</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide7.png" alt="">
                                    <span class="vid-time">8:16</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">Avengers: Infinity War - Gym Workout</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                        <div class="videoo">
                            <div class="vid_thumbainl">
                                <a href="single_video_page.html" title="">
                                    <img src="static/images/resources/vide8.png" alt="">
                                    <span class="vid-time">29:32</span>
                                    <span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
                                </a>
                            </div><!--vid_thumbnail end-->
                            <div class="video_info">
                                <h3><a href="#" title="">How the Universe Works - The Milky Way Galaxy - Space</a></h3>
                                <h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i
                                        class="icon-tick"></i></span></h4>
                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                            </div>
                        </div><!--videoo end-->
                    </div><!--videoo-list-ab end-->
                </div><!--side-bar end-->
            </div>
        </div>
    </div>
</section><!--mn-sec end-->

<section class="more_items_sec text-center">
    <div class="container">
        <a href="#" title="">
            <svg width="19" height="24" viewBox="0 0 19 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.1618 24.0001H0.838235C0.374412 24.0001 0 23.6261 0 23.1628V5.86052C0 5.39727 0.374412 5.02332 0.838235 5.02332H18.1618C18.6256 5.02332 19 5.39727 19 5.86052V23.1628C19 23.6261 18.6256 24.0001 18.1618 24.0001ZM1.67647 22.3256H17.3235V6.69773H1.67647V22.3256Z"
                      fill="#9494A0"/>
                <g opacity="0.25">
                    <path opacity="0.25"
                          d="M13.1324 4.18605C12.6685 4.18605 12.2941 3.81209 12.2941 3.34884V1.67442H6.70589V3.34884C6.70589 3.81209 6.33148 4.18605 5.86765 4.18605C5.40383 4.18605 5.02942 3.81209 5.02942 3.34884V0.83721C5.02942 0.373954 5.40383 0 5.86765 0H13.1324C13.5962 0 13.9706 0.373954 13.9706 0.83721V3.34884C13.9706 3.81209 13.5962 4.18605 13.1324 4.18605Z"
                          fill="#9494A0"/>
                </g>
                <path d="M9.50001 19.3479C9.28487 19.3479 9.06972 19.267 8.90766 19.1024L5.92634 16.1275C5.59942 15.801 5.59942 15.2707 5.92634 14.9442C6.25325 14.6177 6.78413 14.6177 7.11104 14.9442L9.50001 17.3275L11.8862 14.9442C12.2131 14.6177 12.744 14.6177 13.0709 14.9442C13.3978 15.2707 13.3978 15.801 13.0709 16.1275L10.0924 19.1024C9.93031 19.267 9.71516 19.3479 9.50001 19.3479Z"
                      fill="#9494A0"/>
                <path d="M9.49999 18.4186C9.03617 18.4186 8.66176 18.0447 8.66176 17.5814V10.3256C8.66176 9.86236 9.03617 9.4884 9.49999 9.4884C9.96382 9.4884 10.3382 9.86236 10.3382 10.3256V17.5814C10.3382 18.0447 9.96382 18.4186 9.49999 18.4186Z"
                      fill="#9494A0"/>
                <g opacity="0.5">
                    <path opacity="0.5"
                          d="M15.6471 6.69764C15.1832 6.69764 14.8088 6.32369 14.8088 5.86043V4.18601H4.19118V5.86043C4.19118 6.32369 3.81677 6.69764 3.35294 6.69764C2.88912 6.69764 2.51471 6.32369 2.51471 5.86043V3.34881C2.51471 2.88555 2.88912 2.5116 3.35294 2.5116H15.6471C16.1109 2.5116 16.4853 2.88555 16.4853 3.34881V5.86043C16.4853 6.32369 16.1109 6.69764 15.6471 6.69764Z"
                          fill="#9494A0"/>
                </g>
            </svg>
        </a>
    </div>
</section><!--more_items_sec end-->


<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="static/js/script.js"></script>
<%--<script src="static/js/video.js"></script>--%>

<script>

    $(function () {
        $("#searchbtn").click(function () {
            var search = $("#search").val();
            window.location.href =  "http://localhost:8080/mvideo/VideoServlet?action=page&pageno=1&pagesize=8&type=title&search="+search;
        })
    })

    $(function () {
        $.ajax({
            url:"http://localhost:8080/mvideo/HistoryServlet",
            type: "POST",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {
                action:"insertHistoryRecord",
                videoid:${videoid}
            },
            dataType: "text",
            success: function (data) {
                if ("success"==data){
                    console.log("成功添加到历史记录")
                }else{
                    console.log("出错了！")
                }
            }
        })
    })
    $(function () {
        $("#favor${videoid}'").click(function () {
        $.ajax({
            url:"http://localhost:8080/mvideo/CollectionServlet",
            type: "POST",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {
                action:"insertCollection",
                videoid:${videoid}
            },
            dataType: "text",
            success: function (data) {
                if ("success"==data){
                    console.log("成功添加到收藏记录");
                    $("#favor${videoid}").children(".icon-like").attr("class","icon-like");
                    $("#favor${videoid}").attr("title","Unfavorite");
                    $("#favor${videoid}").attr("id","unfavor${videoid}");
                }else{
                    console.log("出错了！")
                }
            }
        })
        })

        $("#unfavor${videoid}").click(function () {
            $.ajax({
                url:"http://localhost:8080/mvideo/CollectionServlet",
                type: "POST",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                data: {
                    action:"delete",
                    videoid:${videoid}
                },
                dataType: "text",
                success: function (data) {
                    if ("success"==data){
                        console.log("成功删除收藏记录");
                        $("#favor${videoid}").children(".icon-like").attr("class","glyphicon-star-empty");
                        $("#unfavor${videoid}").attr("title","Favorite");
                        $("#unfavor${videoid}").attr("id","favor${videoid}");
                    }else{
                        console.log("出错了！")
                    }
                }
            })
        })
    })

</script>
</body>
</html>
