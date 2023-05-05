<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="moviePath" 
	value="http://localhost:8080/VodPlay/getMovie?url=E:/myvod/video/">
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="url" value="pictureUrl?url=E:/myvod/img/"></c:set>
<c:set var="url_user" value="pictureUrl?url=E:/myvod/img/"></c:set>
<html>
	<head>
		<title>播放器</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="在线视频网站" />
		<script src="ckplayer/ckplayer.js" type="text/javascript" charset="utf-8"></script>
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>

		<link href="${cxtPath}/css/indexMovie.css" rel='stylesheet' type='text/css' />
		<link href="${cxtPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="${cxtPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<!-- start plugins -->
		<script type="text/javascript" src="${cxtPath}/js/jquery-1.11.1.min.js"></script>
		<script src="${cxtPath}/js/responsiveslides.min.js"></script>
	</head>

	<body>
		<div class="container">
			<div class="container_wrap">
			<!--顶部-->
				
				<div class="header_top">
					<div class="col-sm-3 logo"  style="margin-top: -2%">
						<a href="index.jsp"><img src="${cxtPath}/images/logo.png" alt="logo" /></a>
					</div>
					<div class="col-sm-5 nav" style="margin-top: -0.5%">
					<ul>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="电影"><a href="${cxtPath}/getMovieByCategory?category=1">
							</a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="电视剧"><a
								href="${cxtPath}/getMovieByCategory?category=2"> </a> </span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="动漫"><a href="${cxtPath}/getMovieByCategory?category=3">
							</a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="综艺"><a
								href="${cxtPath}/getMovieByCategory?category=4"> </a></span></li>
					</ul>
					</div>
					<div class="col-sm-4 header_right">
						<ul class="header_right_box">
							<li>
								<p>
										<c:if test="${user!=null}">
									<a href="${cxtPath}/jsp/user/personalCenter.jsp">
									<img src="${cxtPath}/${user.userPriceUrl}" title="个人中心"
									 alt="头像" style="border-radius:50%;" width=32px height=32px/>
									<font color="#31B0D5" size="4" title="个人中心">${user.userName}</font></a>
										&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="${cxtPath}/userLogout">
									<font color="#31B0D5" size="4" title="退出登录">退出</font></a>
								</c:if></p>
							</li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="content">
					<div class="movie_top">
						<!--主体的左边-->
						<div class="col-md-10 movie_box">
							<div id="ckplayer" style="width: 800; height: 500;margin-top: -1%;"></div>
							<script type="text/javascript">
								CKobject.embed("ckplayer/ckplayer.swf", "ckplayer", "ckplayer1", "800",
										"500", false, {
											//f : "video/mp4",
											f: "${moviePath}${userName}/${movieResult.id}${movieResult.mvType}",
											c : 0
										}, ['${moviePath}${userName}/${movieResult.id}${movieResult.mvType}']

									);
							</script>
							<br>
							<p class="m_5">影片描述：${movieResult.message}</p>
							<br><br><br>
							<form method="post" action="">
								<div class="text">
									<textarea value="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '我的评论:';}">我的评论:</textarea>
								</div>
								<div class="form-submit1">
									<input name="submit" type="submit" id="submit" value="评论"><br>
								</div>
							</form>
							<!--评论列表-->
							<div class="single">
								<h1><font color="#FFFFFF">用户评论列表</font></h1>
								<ul class="single_list">
									<li>
										<div class="preview">
											<a href="#"><img src="images/2.jpg" class="img-responsive" alt="">用户名</a>
										</div>
										<div class="data">
											<div class="title" style="margin-left: 20px;">
												<font color="#FFFFFF">发表评论的时间 </font>
											</div>
											<p style="margin-left: 20px;">
												<font color="#FFFFFF">评论的内容评论的内容评论的内容评论的内容</font>
											</p>
											<p align="right">
												<a href="#">点赞</a> ||
												<a href="#">回复</a> ||
												<a href="#">举报</a>
											</p>
										</div>
										<div class="clearfix"></div>
									</li>

									<li>
										<div class="preview">
											<a href="#"><img src="images/4.jpg" class="img-responsive" alt="个人头像">用户名</a>
										</div>
										<div class="data">
											<div class="title" style="margin-left: 20px;">
												<font color="#FFFFFF">发表评论的时间 </font>
											</div>
											<p style="margin-left: 20px;">
												<font color="#FFFFFF">评论的内容评论的内容评论的内容评论的内容</font>
											</p>
											<p align="right">
												<a href="#">点赞</a> ||
												<a href="#">回复</a> ||
												<a href="#">举报</a>
											</p>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="middle">
										<div class="preview">
											<a href="#"><img src="images/5.jpg" class="img-responsive" alt="个人头像">用户名</a>
										</div>
										<div class="data-middle">
											<div class="title" style="margin-left: 20px;">
												<font color="#FFFFFF">发表评论的时间 </font>
											</div>
											<p style="margin-left: 20px;">
												<font color="#FFFFFF">评论的内容评论的内容评论的内容评论的内容</font>
											</p>
											<p align="right">
												<a href="#">点赞</a> ||
												<a href="#">回复</a> ||
												<a href="#">举报</a>
											</p>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="last-comment">
										<div class="preview">
											<a href="#"><img src="images/6.jpg" class="img-responsive" alt="个人头像">用户名</a>
										</div>
										<div class="data-last">
											<div class="title" style="margin-left: 20px;">
												<font color="#FFFFFF">发表评论的时间 </font>
											</div>
											<p style="margin-left: 20px;">
												<font color="#FFFFFF">评论的内容评论的内容评论的内容评论的内容</font>
											</p>
											<p align="right">
												<a href="#">点赞</a> ||
												<a href="#">回复</a> ||
												<a href="#">举报</a>
											</p>
										</div>
										<div class="clearfix"></div>
									</li>

									<li>
										<div class="preview">
											<a href="#"><img src="images/7.jpg" class="img-responsive" alt="个人头像">用户名</a>
										</div>
										<div class="data">
											<div class="title" style="margin-left: 20px;">
												<font color="#FFFFFF">发表评论的时间 </font>
											</div>
											<p style="margin-left: 20px;">
												<font color="#FFFFFF">评论的内容评论的内容评论的内容评论的内容</font>
											</p>
											<p align="right">
												<a href="#">点赞</a> ||
												<a href="#">回复</a> ||
												<a href="#">举报</a>
											</p>
										</div>
										<div class="clearfix"></div>
									</li>

								</ul>
							</div>
						</div>

						<div class="col-md-2" style="margin-top: -20px">
							<h3><font color="#FFFFFF">播放列表</font></h3>
							<c:forEach items="${movies}" var="mv" begin="${i-2}" end="${i}">
								<div class="grid_2 col_1">
								<a href="${cxtPath}/player?movie=${mv.id}${mv.mvType}">
								<c:if test="${mv.adminId!=null}">
									<img src="${cxtPath}/${url}${mv.username}/${mv.id}${mv.imgType}" title="点击播放"
									 class="img-responsive" alt="视频缩略图" style="width: 143.11px;height: 145px">
								</c:if>
								
								<c:if test="${mv.adminId==null}">
									<img src="${cxtPath}/${url_user}${user.userName}/${mv.id}${mv.imgType}" title="点击播放"
									 class="img-responsive" alt="视频缩略图" style="width: 143.11px;height: 145px">
								</c:if>
								 </a>
								<div class="caption1">
									<p class="m_3">${mv.movieName}</p>
									<c:if test="${mv.id == movieResult.id}">
										<p class="m_32" title="正在播放">&nbsp;&nbsp;正在播放	. . .</p>
									</c:if>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
		</div>
		
		<!--页脚-->
		<div class="container">
			<footer id="footer">
				<div id="footer-3d">
					<div class="gp-container">
						<span class="first-widget-bend"></span>
					</div>
				</div>
				<div id="footer-widgets" class="gp-footer-larger-first-col">
					<div class="gp-container">
						<div class="footer-widget footer-1">
							<div class="wpb_wrapper">
								<img src="images/f_logo.png" alt="" />
							</div>
							<br>
							<p>好看的国产-最新国产-经典国产-国产电影在线网站</p>
							<p class="text">好看的国产-最新国产-经典国产-国产电影在线网站</p>
						</div>
						<div class="footer_box">
							<div class="col_1_of_3 span_1_of_3">
								<h3>友情链接</h3>
								<ul class="first">
									<li>
										<a href="#">爱奇艺</a>
									</li>
									<li>
										<a href="#">腾讯视频</a>
									</li>
									<li>
										<a href="#">百度</a>
									</li>
								</ul>
							</div>
							<div class="col_1_of_3 span_1_of_3">
								<h3>新闻动态</h3>
								<ul class="first">
									<li>
										<a href="#">抢先发布</a>
									</li>
									<li>
										<a href="#">top sellers</a>
									</li>
									<li>
										<a href="#">Specials</a>
									</li>
								</ul>
							</div>
							<div class="col_1_of_3 span_1_of_3">
								<h3>联系我们</h3>
								<ul class="first">
									<li>
										<a href="#">关于我们</a>
									</li>
									<li>
										<a href="#">联系方式</a>
									</li>
									<li>
										<a href="#">留言</a>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>
						</div>

						<!--版权声明-->
						<div class="copy" align="center">
							<p>Copyright &copy; 2015-2020.sheep.</p>
						</div>
						<div class="clearfix"> </div>

					</div>
				</div>
			</footer>

		</div>
	</body>

</html>