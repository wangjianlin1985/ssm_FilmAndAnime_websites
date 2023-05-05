<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<html>

	<head>
		<title>管理员登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="在线视频网站" />

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
				<div class="header_top">
					<div class="col-sm-3 logo">
						<a href="${cxtPath}/index.jsp"><img src="${cxtPath}/images/logo.png" alt="" title="返回网站首页" /></a>
					</div>
					<div class="col-sm-6 nav">
						<ul>
							<li> <span class="simptip-position-bottom simptip-movable" data-tooltip="电影"><a href="${cxtPath}/jsp/movie/movie.jsp"> </a></span></li>
							<li><span class="simptip-position-bottom simptip-movable" data-tooltip="电视剧"><a href="${cxtPath}/jsp/movie/TVPlay.jsp"> </a> </span></li>
							<li><span class="simptip-position-bottom simptip-movable" data-tooltip="动漫"><a href="${cxtPath}/jsp/movie/comic.jsp"> </a></span></li>
							<li><span class="simptip-position-bottom simptip-movable" data-tooltip="综艺"><a href="${cxtPath}/jsp/movie/variety.jsp"> </a></span></li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="content">
					<div class="register">
						<div class="col-md-12 login-right" align="center">
							<h3><font color="#FFFFFF" size="7">管理员登录</font></h3>
							<form method="post" action="${cxtPath}/adminLogin">
								<div>
									<input type="text" style="width: 30%;"  name="adminName" value="" placeholder="请输入管理员账户" />
								</div>
								<div>
									<input type="password"  style="width: 30%;"   name="password" value="" placeholder="请输入密码"/>
								</div>
								<div>
									<font style="color: white;">
										角色：
										<input type="radio" name="role" value="视频管理员" checked="checked"/>视频管理员
										<input type="radio" name="role" value="用户管理员"/>用户管理员
										<input type="radio" name="role" value="系统管理员"/>系统管理员
									</font>
								</div>
								<div>
									<input type="submit" value="登录">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="重置" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
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