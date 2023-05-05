<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="url" value="pictureUrl?url=E:/myvod/img/"></c:set>
<html>
<head>
<title>在线视频</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="在线视频网站" />
<link href="css/indexMovie.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<link rel="stylesheet" href="css/baidulogin.css" />
<script src="${cxtPath}/js/user.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>

</head>

<body>
	<script type="text/javascript" src="js/baidulogin.js"></script>
	<div class="container">
		<div class="container_wrap">
			<!--顶部-->
			<div class="header_top">
				<div class="col-sm-3 logo" style="margin-top: -2%">
					<img src="${cxtPath}/images/logo.png" alt="logo" title="sheep影音"/>
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
						<li><c:if test="${user!=null}">
								<p>
									<a href="${cxtPath}/jsp/user/personalCenter.jsp"> <img
										src="${cxtPath}/${user.userPriceUrl}" alt="头像" title="个人中心"
										style="border-radius: 50%;" width=32px height=32px /> <font
										color="#31B0D5" size="4" title="个人中心">${user.userName}</font></a>
									&nbsp;&nbsp;|&nbsp;&nbsp; <a href="${cxtPath}/userLogout">
										<font color="#31B0D5" size="4" title="退出登录">退出</font>
									</a>
								</p>
							</c:if> <c:if test="${user==null}">
								<p>
								<div class="link">
									<a href="javascript:showDialog();"> <font color="#31B0D5"
										size="4" title="登录">登录</font>
									</a>|&nbsp;&nbsp;&nbsp;| <a href="register.jsp"> <font
										color="#31B0D5" size="4" title="注册">注册</font>
									</a>
								</div>
								</p>
							</c:if></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>

			<!--弹出-->
			<div class="ui-mask" id="mask" onselectstart="return false"></div>
			<div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
				<div class="ui-dialog-title" id="dialogDrag"
					onselectstart="return false;">
					登录通行证 <a class="ui-dialog-closebutton"
						href="javascript:hideDialog();"></a>
				</div>
				<div class="ui-dialog-content">
					<form action="${cxtPath}/userLogin" method="post" id="loginForm"
						onsubmit="return check(this)">
						<div class="ui-dialog-l40">
							<input class="ui-dialog-input ui-dialog-input-username"
								id="userName" type="input" placeholder="用户名" value=""
								name="userName" />
						</div>
						<div style="height: 25px;">
							<font color="red" id="username_span"></font>
						</div>
						<div class="ui-dialog-l40">
							<input class="ui-dialog-input ui-dialog-input-password"
								id="userPassword" type="password" placeholder="密码" value=""
								name="userPassword" />
						</div>
						<div style="height: 25px;">
							<font color="red" id="userPassword_span"></font>
						</div>
						<div class="ui-dialog-l41">
							<input type="test" placeholder="验证码" value="" name="vcode"
								id="codeid" /> <img id="code" src="${cxtPath}/vcode"
								onclick="checkcode()" height="40px">
						</div>
						<div style="height: 25px;">
							<font color="red" id="vodespan"></font>
						</div>
						<div>
							<input type="submit" value="登录" class="ui-dialog-submit" />
						</div>
						<div class="ui-dialog-l40" style="float: left;">
							<a href="#">忘记密码</a>
						</div>
						<div class="ui-dialog-l40" style="float: right;">
							<a href="register.jsp">立即注册</a>
						</div>
					</form>
				</div>
			</div>
			<!--弹出 end-->


			<!--轮播-->
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">
						<c:forEach var="slider" items="${sliders}">
							<li><img
								style="position: relative; width: 1194px; height: 497px"
								src="${cxtPath}/${url}${slider.username}/${slider.id}${slider.sliderImage}"
								class="img-responsive" alt="${slider.movieName}" /> <label
								style="position: relative;"> <font color="#FFFFF"
									size="4">上映时间：</font> <span class="m_1"> <f:formatDate
											value="${slider.showTime}" pattern="yyyy-MM-dd" />
								</span> &nbsp;&nbsp; <font color="#FFFFF" size="4">评分：</font> <span
									class="m_1">${slider.grade}</span> &nbsp;&nbsp; <font
									color="#FFFFF" size="4">下载次数：</font> <span class="m_1">${slider.downloads}</span>
									&nbsp;&nbsp; <font color="#FFFFF" size="4">播放次数：</font> <span
									class="m_1">${slider.plays}</span>

							</label>
								<div class="button">
									<a href="${cxtPath}/player?movie=${slider.id}${slider.mvType}"
										class="hvr-shutter-out-horizontal" title="点击播放" >现在就去看</a>
								</div></li>
						</c:forEach>
					</ul>
				</div>

			</div>

			<div class="content">

				<div class="box_1">
					<h1 class="m_2">
						<font color="#FFFFFF" size="7">热门视频</font>
					</h1>
					<!--搜索栏-->
					<div class="search" style="text-align-last: center;">
						<form action="${cxtPath}/searchIndexMovie"  method="post">
							<input type="text" value="万部影片任你挑" onFocus="this.value='';"
								onBlur="if (this.value == '') {this.value ='';}" name="movieName"> <input
								type="submit" value="" title="点击搜索">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="box_2">

					<!--高分电影-->
					<div class="col-md-5 grid_3">
						<br />
						<h3>
							<font color="#DFF0D8">高分电影</font>
						</h3>
						<form>
							<div class="row_1">
								<div class="col-md-6 grid_4">
									<c:forEach var="movie" items="${movies}" begin="0" end="2">
										<br>
										<div class="grid_2">
											<a href="${cxtPath}/player?movie=${movie.id}${movie.mvType}">
												<img src="${cxtPath}/${url}${movie.username}/${movie.id}${movie.imgType}"
												class="img-responsive" alt="${movie.movieName}"
												style="width: 200px; height: 183px" title="点击播放"  />
											</a>
										</div>
										<div class="caption1">
											<p class="m_3">
												<a
													href="${cxtPath}/player?movie=${movie.id}${movie.mvType}">${movie.movieName}</a>
											</p>
											<p class="m_4">${movie.message}</p>
										</div>
										<br>
									</c:forEach>
								</div>

								<div class="col-md-6 grid_4">
									<c:forEach var="movie" items="${movies}" begin="3" end="5">
										<br>
										<div class="grid_2">
											<a href="${cxtPath}/player?movie=${movie.id}${movie.mvType}">
												<img src="${cxtPath}/${url}${movie.username}/${movie.id}${movie.imgType}"
												class="img-responsive" alt="${movie.movieName}"
												style="width: 200px; height: 183px" title="点击播放" />
											</a>
										</div>
										<div class="caption1">
											<p class="m_3">
												<a
													href="${cxtPath}/player?movie=${movie.id}${movie.mvType}">${movie.movieName}</a>
											</p>
											<p class="m_4">${movie.message}</p>
										</div>
										<br>
									</c:forEach>
								</div>
								<div class="clearfix"></div>
								<br>
								<h4 align="right" style="margin-right: 50px;">
									<a href="${cxtPath}/getMovieByCategory?category=1">更多</a>
								</h4>
							</div>
						</form>
					</div>

					<!--热播电视剧-->
					<div class="col-md-5 content_right grid_3">
						<br />
						<h3 style="margin-left: 18px;">
							<font color="#DFF0D8">热播电视剧</font>
						</h3>
						<div class="row_3">
							<div class="col-md-6 grid_4">
								<c:forEach var="tvplay" items="${tvplays}" begin="0" end="2">
									<br>
									<div class="grid_2">
										<a
											href="${cxtPath}/player?movie=${tvplay.id}${tvplay.mvType}">
											<img src="${cxtPath}/${url}${tvplay.username}/${tvplay.id}${tvplay.imgType}"
											class="img-responsive" alt="${tvplay.movieName}"
											style="width: 200px; height: 183px" title="点击播放" />
										</a>
									</div>
									<div class="caption1">
										<p class="m_3">
											<a
												href="${cxtPath}/player?movie=${tvplay.id}${tvplay.mvType}">${tvplay.movieName}</a>
										</p>
										<p class="m_4">${tvplay.message}</p>
									</div>
									<br>
								</c:forEach>
							</div>

							<div class="col-md-6 grid_4">
								<c:forEach var="tvplay" items="${tvplays}" begin="3" end="5">
									<br>
									<div class="grid_2">
										<a
											href="${cxtPath}/player?movie=${tvplay.id}${tvplay.mvType}">
											<img src="${cxtPath}/${url}${tvplay.username}/${tvplay.id}${tvplay.imgType}"
											class="img-responsive" alt="${tvplay.movieName}"
											style="width: 200px; height: 183px" title="点击播放" />
										</a>
									</div>
									<div class="caption1">
										<p class="m_3">
											<a
												href="${cxtPath}/player?movie=${tvplay.id}${tvplay.mvType}">${tvplay.movieName}</a>
										</p>
										<p class="m_4">${tvplay.message}</p>
									</div>
									<br>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
							<br>
							<h4 align="right" style="margin-right: 50px;">
							<a href="${cxtPath}/getMovieByCategory?category=2">更多</a>
							</h4>
						</div>
					</div>
				</div>

				<!--排行榜-->
				<div class="col-md-2 grid_6">
					<br />
					<h3>
						<font color="#DFF0D8">播放榜</font>
					</h3>
						<c:forEach var="ranking" items="${rankings}" begin="0" end="3">
							<div class="grid_2">
								<a href="${cxtPath}/player?movie=${ranking.id}${ranking.mvType}">
									<img src="${cxtPath}/${url}${ranking.username}/${ranking.id}${ranking.imgType}"
									class="img-responsive" alt="${ranking.movieName}"
									style="width: 160px; height: 143px" title="点击播放" />
								</a>
							</div>
							<div class="caption1">
								<p class="m_41">${ranking.message}</p>
								<p class="m_31">
									<a href="${cxtPath}/player?movie=${ranking.id}${ranking.mvType}">${ranking.movieName}</a>
								</p>
							</div>
							<br><br>
						</c:forEach>
					<h4 align="right" style="margin-right: 10px;">
						<a href="#">更多</a>
					</h4>
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
							<li><a href="http://www.iqiyi.com" target="_blank">爱奇艺</a></li>
							<li><a href="https://v.qq.com/index.html" target="_blank">腾讯视频</a>
							</li>
							<li><a href="https://www.baidu.com/" target="_blank">百度</a>
							</li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>新闻动态</h3>
						<ul class="first">
							<li><a href="#">抢先发布</a></li>
							<li><a href="#">top sellers</a></li>
							<li><a href="#">Specials</a></li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>联系我们</h3>
						<ul class="first">
							<li><a href="protocol.html" title="用户协议">关于我们</a></li>
							<li><a href="#">联系方式</a></li>
							<li><a href="${cxtPath}/checkAdmin" title="管理员登录">后台管理</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>

				<!--版权声明-->
				<div class="copy" align="center">
					<p>Copyright &copy; 2015-2020.sheep.</p>
				</div>
				<div class="clearfix"></div>

			</div>
		</div>
		</footer>

	</div>
</body>
</html>