<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<title>jQuery点击展开收缩树形菜单</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

body {
	font-size: 12px;
	font-family: "宋体", "微软雅黑";
}

ul, li {
	list-style: none;
}

a:link, a:visited {
	text-decoration: none;
	color: #fff;
}

.list {
	width: 210px;
	border-bottom: solid 1px #316a91;
	margin: 40px auto 0 auto;
}

.list ul li {
	background-color: #467ca2;
	border: solid 1px #316a91;
	border-bottom: 0;
}

.list ul li a {
	padding-left: 10px;
	color: #fff;
	font-size: 12px;
	display: block;
	font-weight: bold;
	height: 36px;
	line-height: 36px;
	position: relative;
}

.list ul li .inactive {
	background: url(images/off.png) no-repeat 184px center;
}

.list ul li .inactives {
	background: url(images/on.png) no-repeat 184px center;
}

.list ul li ul {
	display: none;
}

.list ul li ul li {
	border-left: 0;
	border-right: 0;
	background-color: #6196bb;
	border-color: #467ca2;
}

.list ul li ul li ul {
	display: none;
}

.list ul li ul li a {
	padding-left: 20px;
}

.list ul li ul li ul li {
	background-color: #d6e6f1;
	border-color: #6196bb;
}

.last {
	background-color: #d6e6f1;
	border-color: #6196bb;
}

.list ul li ul li ul li a {
	color: #316a91;
	padding-left: 30px;
}
</style>
<script type="text/javascript" src="${cxtPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.inactive')
								.click(
										function() {
											var className = $(this).parents(
													'li').parents().attr(
													'class');
											if ($(this).siblings('ul').css(
													'display') == 'none') {
												if (className == "yiji") {
													$(this)
															.parents('li')
															.siblings('li')
															.children('ul')
															.parent('li')
															.children('a')
															.removeClass(
																	'inactives');
													$(this).parents('li')
															.siblings('li')
															.children('ul')
															.slideUp(100);
													$(this)
															.parents('li')
															.children('ul')
															.children('li')
															.children('ul')
															.parent('li')
															.children('a')
															.removeClass(
																	'inactives');
													$(this).parents('li')
															.children('ul')
															.children('li')
															.children('ul')
															.slideUp(100);
												}
												$(this).addClass('inactives');
												$(this).siblings('ul')
														.slideDown(100);
											} else {
												$(this)
														.removeClass(
																'inactives');
												$(this).siblings('ul').slideUp(
														100);
											}
										})
					});
</script>
</head>
<body>
	<div class="list">
		<ul class="yiji">
			<li><a href="#">中国美协章程</a></li>
			<li><a href="#" class="inactive active">中国文联美术艺术中心</a>
				<ul>
					<li><a href="#">综合部</a></li>
					<li><a href="#">大型活动部</a></li>
					<li><a href="#">展览部</a></li>
					<li><a href="#">艺委会工作部</a></li>
					<li><a href="#">信息资源部</a></li>
					<li><a href="#">双年展办公室</a></li>
				</ul></li>

			<li><a href="#" class="inactive">组织机构</a>
				<ul style="display: none">
					<li><a href="#" class="inactive active">美协机关</a>
						<ul>
							<li><a href="#">办公室</a></li>
							<li><a href="#">人事处</a></li>
							<li><a href="#">组联部</a></li>
							<li><a href="#">外联部</a></li>
							<li><a href="#">研究部</a></li>
							<li><a href="#">维权办</a></li>
						</ul></li>
					<li><a href="#" class="inactive active">中国文联美术艺术中心</a>
						<ul>
							<li><a href="#">综合部</a></li>
							<li><a href="#">大型活动部</a></li>
							<li><a href="#">展览部</a></li>
							<li><a href="#">艺委会工作部</a></li>
							<li><a href="#">信息资源部</a></li>
							<li><a href="#">双年展办公室</a></li>
						</ul></li>
					<li class="last"><a href="#">《美术》杂志社</a></li>
				</ul></li>


			<li><a href="#" class="inactive">组织机构</a>
				<ul style="display: none">
					<li><a href="#" class="inactive active">美协机关</a>
						<ul>
							<li><a href="#">办公室</a></li>
							<li><a href="#">人事处</a></li>
							<li><a href="#">组联部</a></li>
							<li><a href="#">外联部</a></li>
							<li><a href="#">研究部</a></li>
							<li><a href="#">维权办</a></li>
						</ul></li>
					<li><a href="#" class="inactive active">中国文联美术艺术中心</a>
						<ul>
							<li><a href="#">综合部</a></li>
							<li><a href="#">大型活动部</a></li>
							<li><a href="#">展览部</a></li>
							<li><a href="#">艺委会工作部</a></li>
							<li><a href="#">信息资源部</a></li>
							<li><a href="#">双年展办公室</a></li>
						</ul></li>
					<li class="last"><a href="#">《美术》杂志社</a></li>
				</ul></li>
		</ul>
	</div>
</body>
</html>