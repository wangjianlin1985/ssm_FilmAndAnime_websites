<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="url" value="pictureUrl?url=E:/myvod/img/"></c:set>
<html>
	<head>
		<title>影片管理</title>
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

		<link href="${cxtPath}/css/indexMovie.css" rel='stylesheet' type='text/css' />
		<link href="${cxtPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="${cxtPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="${cxtPath}/js/jquery-1.11.1.min.js"></script>
		<script src="${cxtPath}/js/responsiveslides.min.js"></script>
		<script src="${cxtPath}/js/page.js"></script>
		<script src="${cxtPath}/js/movie.js"></script>
	</head>

	<body>
		<div class="container">
			<div class="container_wrap">
			<!--顶部-->
				<div class="header_top">
					<div class="col-sm-3 logo"  style="margin-top: -2%">
						<a href="${cxtPath}/index.jsp"><img src="${cxtPath}/images/logo.png" alt="logo" /></a>
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
									<img src="${cxtPath}/${user.userPriceUrl}" title="个人中心"
									alt="头像" style="border-radius:50%;" width=32px height=32px/>
									<font color="#31B0D5" size="4" title="个人中心">个人中心</font>
										&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="${cxtPath}/userLogout" title="退出登录">
									<font color="#31B0D5" size="4">退出</font></a>
								</c:if>
								</p>
							</li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!--主体-->
				<div class="content">

					<div class="movie_top">
						<div class="col-md-3">
							<div style="border:2px solid #F7E1B5; width: 53%;height: 675px">
								<div class="movie_img">
									<div class="grid_2">
										<a href="${cxtPath}/jsp/user/personalCenter.jsp">
											<h3><font color="#FFFFFF">个人资料</font></h3></a>
									</div>
									<div class="grid_2 col_1">
										<a href="${cxtPath}/jsp/user/editUser.jsp">
											<h3><font color="#FFFFFF">修改资料</font></h3></a>
									</div>
									<div class="grid_2 col_1">
										<h3><font color="#285E8E">影片管理</font></h3>
									</div>
									<div class="grid_2 col_1">
										<a href="">
											<h3><font color="#FFFFFF">我的会员</font></h3></a>
									</div>
									<div class="grid_2 col_1">
										<a href="">
											<h3><font color="#FFFFFF">我的粉丝</font></h3></a>
									</div>
									<div class="grid_2 col_1">
										<a href="">
											<h3><font color="#FFFFFF">我的积分</font></h3></a>
									</div>
									<div class="grid_2 col_1">
										<a href="">
											<h3><font color="#FFFFFF">我的订阅</font></h3></a>
									</div>
								</div>
							</div>
						</div>
						<form method="post" action="">
						<!--主体的右边-->
						<div class="col-md-9 movie_box">
							<h2><font color="#FFFFFF">我的影片</font></h2>
							<hr>
							<div>
								<div align="center" style="float: left;">
									<a class="pagebtn" style="border:1px solid #FFFFE0;" href="${cxtPath}/toUpload">上传影片</a>
								</div>
								<div align="right" style="float: right;">
										<input type="text" value="" placeholder="请输入片名、类型等" name="movieName" class="pageValue" 
											style="background: none; border:1px solid #FFFFE0;" align="right" id="movieName"> 
										<input type="button" class="pagebtn"  value="搜索" style="margin-left: -6px; 
											border:1px solid #FFFFE0;" onclick="searchMovie()" >
								</div>
							</div>
							<div class="clearfix"> </div>
							<br>
							
							<c:forEach var="mv" items="${movielist}">
								<div class="movie movie-test movie-test-dark movie-test-left">
                                <div class="movie__images" style=" width:200px;height:200px">
                                    <a href="${cxtPath}/player?movie=${mv.id}${mv.mvType}"
                                    		class="movie-beta__link">
                                        <img src="${cxtPath}/${url}${user.userName}/${mv.id}${mv.imgType}"
                                         class="img-responsive" alt="影片缩略图" title="点击播放"
                                         style=" width:200px;height:200px"/>
                                    </a>
                                </div>
								<div class="movie__info">
                                    <a href="${cxtPath}/player?movie=${mv.id}${mv.mvType}"class="movie__title">${mv.movieName}</a>
                                    <p class="movie__time"><span>时长：</span>${mv.option}</p>
									<p class="movie__option"><span>地区：</span>${mv.movieCountry}</p>
                                    <ul class="list_6">
						    			<li>评分 ：<p>${mv.grade}</p></li>
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			<li><i class="icon3"> </i><p>${mv.downloads}</p></li>
						    		</ul>
                                 </div>
                                 &nbsp;
                                 <input type="button" alt="编辑影片" value="编辑" onclick="editMovie('${mv.id}')"
                                 style="background: none;color: #FFF;border: 2px solid #2C518D;"/> 
                                 &nbsp;
                                 <input type="button" alt="删除影片" value="删除" onclick="delMovie('${mv.id}')"
                                 style="background: none;color: #FFF;border: 2px solid #2C518D;"/> 
                                <div class="clearfix"> </div>
                            </div>
							</c:forEach>
							<div class="clearfix"> </div>
							<br/>
							
							<!--分页按钮-->
							<input type="button" class="pagebtn" value="第一页" onclick="toPage(1)"/> - 
							<input type="button" class="pagebtn" value="上一页" onclick="toPage(${movie.currentPage-1})"/> - 
							<input type="button" class="pagebtn" value="当前页:${movie.currentPage}"/> - 
							<input type="button" class="pagebtn" value="下一页" onclick="toPage(${movie.currentPage+1})" /> - 
							<input type="button" class="pagebtn" value="尾    页" onclick="toPage(${movie.totalPage})"/> - 
							<input type="text" class="page" value="共 ${movie.totalPage} 页    跳转到第" 
							size="16" disabled="disabled" /> - 
							<input type="text" value="${movie.currentPage}" id="currentPage"
							 class="pageValue" size="2" onblur="toPage(this.value)"
							  style="background: none; border: 1px solid #FFFFE0;" /> - 
							  <input type="button" class="pagebtn" value="页    go" />
							  <input type="hidden" name="currentPage" id="hidecurrentPage" value="${movie.currentPage}"/>
						</div>
						<div class="clearfix"> </div>
						</form>
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