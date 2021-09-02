<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Oren Video Template</title>
	<%-- 静态包含 base 标签 --%>
	<%@ include file="../../common/head.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
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
							<h2 class="hd-uc"> <i class="icon-user"></i> 我的账户</h2>
							<a href="pages/user/usersettings.jsp">个人资料修改</a>
						</div><!--account end-->
						<div class="widget notifications">
							<h2 class="hd-uc"><i class="icon-paid_sub"></i>我的钱包</h2>
							<a href="#" title="">账号充值</a>
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
						<div class="latest_vidz">
							<div class="latest-vid-option">
								<h2 class="hd-op"> 视频管理</h2>
								<a title="" class="op-1">已上传视频</a>
								<div class="clearfix"></div>
							</div><!--latest-vid-option end-->
							<div class="vidz_list">
								<c:forEach items="${ requestScope.personalVideo }" var="video">
									<c:if test="${ video.status == 0 }">
										<div class="tb-pr">
											<div class="row">
												<div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
													<div class="tab-history acct_page">
														<div class="videoo">
															<div class="vid_thumbainl ms br">
																<a href="pages/video/singlevideopage.jsp?uploaderid=${ video.uploaderId }&videoid=${ video.id }" title="">
																	<img src="${ video.coverPic }" alt="" />
																	<span class="vid-time">30:32</span>
																	<span class="watch_later">
																	<i class="icon-watch_later_fill"></i>
																</span>
																</a>
															</div><!--vid_thumbnail end-->
															<div class="video_info ms br">
																<h3><a href="pages/video/singlevideopage.jsp?uploaderid=${ video.uploaderId }&videoid=${ video.id }" title="">${ video.title }</a></h3>
																<h4>${ sessionScope.user.nickName }<span class="verify_ic"><i class="icon-tick"></i></span></h4>
																<span>${ video.viewed } . 1 week ago</span>
															</div>
															<div class="clearfix"></div>
														</div><!--videoo end-->
													</div>
												</div>
												<div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
													<div class="icon-list">
														<ul>
															<li value="${ video.id }"><a name="off" title=""><i class="icon-cancel" title="下架视频" data-toggle="tooltip" data-placement="top">
															</i></a></li>
														</ul>
													</div><!--icon-list end-->
												</div>
											</div>
										</div><!--tb-pr end-->
									</c:if>
								</c:forEach>
							</div><!--vidz_list end-->
						</div><!--latest_vidz end-->

						<div class="video-details">
							<div class="latest_vidz">
								<div class="latest-vid-option">
									<a title="" class="op-1">待审核</a>
									<div class="clearfix"></div>
								</div><!--latest-vid-option end-->
								<div class="vidz_list">
									<c:forEach items="${ requestScope.personalVideo }" var="video">
										<c:if test="${ video.status == 1 }">
											<div class="tb-pr">
												<div class="row">
													<div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
														<div class="tab-history acct_page">
															<div class="videoo">
																<div class="vid_thumbainl ms br">
																		<img src="${ video.coverPic }" alt="" style="height: 160px;width: 265px"/>
																		<span class="vid-time">30:32</span>
																		<span class="watch_later">
																	<i class="icon-watch_later_fill"></i>
																</span>
																</div><!--vid_thumbnail end-->
																<div class="video_info ms br">
																	<h3>${ video.title }</h3>
																	<h4>${ sessionScope.user.nickName }<span class="verify_ic"><i class="icon-tick"></i></span></h4>
																	<span>${ video.viewed } . 1 week ago</span>
																</div>
																<div class="clearfix"></div>
															</div><!--videoo end-->
														</div>
													</div>
													<div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
														<div class="icon-list">
															<ul>
																<li value="${ video.id }"><a name="off" title=""><i class="icon-cancel" title="下架视频" data-toggle="tooltip" data-placement="top">
																</i></a></li>
															</ul>
														</div><!--icon-list end-->
													</div>
												</div>
											</div><!--tb-pr end-->
										</c:if>
									</c:forEach>
								</div><!--vidz_list end-->
							</div><!--latest_vidz end-->


							<div class="video-details">
								<div class="latest_vidz">
									<div class="latest-vid-option">
										<a title="" class="op-1">下架视频</a>
										<div class="clearfix"></div>
									</div><!--latest-vid-option end-->
									<div class="vidz_list">
										<c:forEach items="${ requestScope.personalVideo }" var="video">
											<c:if test="${ video.status == 2 }">
												<div class="tb-pr">
													<div class="row">
														<div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
															<div class="tab-history acct_page">
																	<div class="videoo">
																		<div class="vid_thumbainl ms br">
																			<img src="${ video.coverPic }" alt="" style="height: 160px;width: 265px"/>
																			<span class="vid-time">30:32</span>
																			<span class="watch_later">
																	<i class="icon-watch_later_fill"></i>
																</span>
																		</div><!--vid_thumbnail end-->
																	<div class="video_info ms br">
																		<h3>${ video.title }</h3>
																		<h4>${ sessionScope.user.nickName }<span class="verify_ic"><i class="icon-tick"></i></span></h4>
																		<span>${ video.viewed } . 1 week ago</span>
																	</div>
																	<div class="clearfix"></div>
																</div><!--videoo end-->
															</div>
														</div>
														<div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
															<div class="icon-list">
																<ul>
																	<li><a href="UploadServlet?action=updateshow&id=${ video.id }" title=""><i class="icon-pencil" title="编辑视频" data-toggle="tooltip" data-placement="top"></i></a></li>
																	<li value="${ video.id }"><a name="del" title="" ><i class="icon-cancel" title="删除视频" data-toggle="tooltip" data-placement="top">
																	</i></a></li>
																</ul>
															</div><!--icon-list end-->
														</div>
													</div>
												</div><!--tb-pr end-->
											</c:if>
										</c:forEach>
									</div><!--vidz_list end-->
								</div><!--latest_vidz end-->


					</div><!--video-details end-->
				</div>
			</div>
		</div></div>
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
	$(function () {
		//提示框
		$("[name=del]").click(function () {
			var id = $(this).parent().val();
			//询问框
			layer.confirm('是否删除视频？', {
				btn: ['确认','取消'], //按钮
			}, function(){
				layer.msg("删除成功", {time: 2000}, function () {
					location.href = "VideoServlet?action=videoOff&del=1&id="+id;
				});
			}, function(){
			});
		})

		$("[name=off]").click(function () {
			var id = $(this).parent().val();
			//询问框
			layer.confirm('是否下架视频？', {
				btn: ['确认','取消'], //按钮
			}, function(){
					location.href = "VideoServlet?action=videoOff&id="+id;
			}, function(){
			});
		})
	})


</script>



</body>
</html>