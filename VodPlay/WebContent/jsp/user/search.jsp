<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="url" value="pictureUrl?url=E:/myvod/img/"></c:set>
<html>

<head>
<title>个人中心搜索页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="在线视频网站" />
<script type="application/x-javascript">
	
	
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		

</script>

<link href="${cxtPath}/css/indexMovie.css" rel='stylesheet'
	type='text/css' />
<link href="${cxtPath}/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<link href="${cxtPath}/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- start plugins -->
<script type="text/javascript" src="${cxtPath}/js/jquery-1.11.1.min.js"></script>
<link
	href='http://fonts.useso.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<script src="${cxtPath}/js/responsiveslides.min.js"></script>
<script src="${cxtPath}/js/page.js"></script>
</head>

<body>
	<div class="container">
		<div class="container_wrap">
			<!--顶部-->
			<div class="header_top">
				<div class="col-sm-3 logo" style="margin-top: -2%">
					<a href="${cxtPath}/index.jsp"><img
						src="${cxtPath}/images/logo.png" alt="logo" /></a>
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
									<a href="${cxtPath}/jsp/user/personalCenter.jsp"> <img
										src="${cxtPath}/${user.userPriceUrl}" alt="头像"
										style="border-radius: 50%;" width=32px height=32px /> <font
										color="#31B0D5" size="4">${user.userName}</font></a>
										&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="${cxtPath}/userLogout"> <font color="#31B0D5"
										size="4">退出</font></a>
								</c:if>
							</p>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="content">
				<div style="float: left;">
					<h2 class="m_3">
						<font color="#FFFFFF">搜索结果</font>
					</h2>
				</div>
				<div style="float: right;margin-right: 390px">
					<div class="search" style="text-align-last: center;">
						<form action="${cxtPath}/searchMovie"  method="post">
							<input type="text" value="${search}" onFocus="this.value='';"
								onBlur="if (this.value == '') {this.value ='';}" name="movieName">
							<input type="submit" value="">
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
					<div class="movie_top">
						<form method="post" action="">
							<div class="col-md-9 movie_box">
								<c:if test="${listMovie.isEmpty()}">
									<div style="color: white; font-size: 35px">
										<br><br>暂无结果！<br><br>
									</div>
								</c:if>
								<c:forEach var="movie" items="${listMovie}">
									<div class="movie movie-test movie-test-dark movie-test-left">
										<div class="movie__images">
											<a href="${cxtPath}/player?movie=${movie.id}${movie.mvType}"
											 class="movie-beta__link"> <img
												src="${cxtPath}/${url}${movie.username}/${movie.id}${movie.imgType}"
												class="img-responsive" alt="${movie.movieName}"
												style="width: 196px; height: 188px;"
												title="${movie.movieName}" />
											</a>
										</div>
										<div class="movie__info">
											<ul class="list_6">
												<li><a href="${cxtPath}/player?movie=${movie.id}${movie.mvType}">${movie.movieName}</a></li>
												<li>时长：
													<p>${movie.option}</p>
												</li>
												<li>地区:
													<p>${movie.movieCountry}</p>
												</li>
												<li>播放：
													<p>${movie.plays}次</p>
												</li>
												<li>下载：
													<p>${movie.downloads}次</p>
												</li>
												<li>评分：
													<p>${movie.grade}分</p>
												</li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</c:forEach>

								<div class="clearfix"></div>
								<!--分页按钮-->
								<input type="button" class="pagebtn" value="第一页"
									onclick="toPageSearchPerson(1)" /> - <input type="button"
									class="pagebtn" value="上一页"
									onclick="toPageSearchPerson(${movie.currentPage-1})" /> - <input
									type="button" class="pagebtn" value="下一页"
									onclick="toPageSearchPerson(${movie.currentPage+1})" /> - <input
									type="button" class="pagebtn" value="尾    页"
									onclick="toPageSearchPerson(${movie.totalPage})" /> - <input disabled="disabled" title="当前页"
									type="button" class="pagebtn" value="当前页:${movie.currentPage}" />
								- <input type="text" class="page"
									value="共 ${movie.totalPage} 页    跳转到第" size="16"
									disabled="disabled" /> - <input type="text"
									value="${movie.currentPage}" id="currentPage" class="pageValue"
									size="2" onblur="toPageSearchPerson(this.value)"
									style="background: none; border: 1px solid #FFFFE0;" title="请输入阿拉伯数字"/> - <input
									type="button" class="pagebtn" value="页    go" /> <input
									type="hidden" name="currentPage" id="hidecurrentPage"
									value="${movie.currentPage}" />
									<input type="hidden" name="movieName" id="hidemovieNamee"
									value="${search}" />
							</div>
						</form>
						<!-- 排行榜 -->
						<div class="col-md-3">
							<h3>
								<font color="#FFFFFF">热播排行榜</font>
							</h3>
							<c:forEach var="ranking" items="${rankings}" begin="0" end="2">
								<div class="grid_2">
									<a
										href="${cxtPath}/player?movie=${ranking.id}${ranking.mvType}">
										<img src="${cxtPath}/${url}${ranking.username}/${ranking.id}${ranking.imgType}"
										class="img-responsive" alt="${ranking.movieName}"
										style="width: 213.28px; height: 143px" />
									</a>
								</div>
								<div class="caption1">
									<p class="m_41">${ranking.message}</p>
									<p class="m_31">
										<a
											href="${cxtPath}/player?movie=${ranking.id}${ranking.mvType}">${ranking.movieName}</a>
									</p>
								</div>
								<br>
								<br>
							</c:forEach>
							<h4 align="right" style="margin-right: 10px;">
								<a href="#">更多</a>
							</h4>
						</div>
						<div class="clearfix"></div>
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
						<img src="${cxtPath}/images/f_logo.png" alt="" />
					</div>
					<br>
					<p>好看的国产-最新国产-经典国产-国产电影在线网站</p>
					<p class="text">好看的国产-最新国产-经典国产-国产电影在线网站</p>
				</div>
				<div class="footer_box">
					<div class="col_1_of_3 span_1_of_3">
						<h3>友情链接</h3>
						<ul class="first">
							<li><a href="#">爱奇艺</a></li>
							<li><a href="#">腾讯视频</a></li>
							<li><a href="#">百度</a></li>
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
							<li><a href="#">关于我们</a></li>
							<li><a href="#">联系方式</a></li>
							<li><a href="#">留言</a></li>
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