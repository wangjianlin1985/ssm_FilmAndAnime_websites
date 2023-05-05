<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台视频上传</title>
<link href="${cxtPath}/css/indexMovie.css" rel='stylesheet'
	type='text/css' />
<link href="${cxtPath}/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<link href="${cxtPath}/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="${cxtPath}/js/jquery-1.11.1.min.js"></script>
<script src="${cxtPath}/js/responsiveslides.min.js"></script>
<script type="text/javascript" src="${cxtPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cxtPath}/js/plupload.full.min.js"></script>
<script type="text/javascript" src="${cxtPath}/js/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="${cxtPath}/js/zh_CN.js"></script>
<link href="${cxtPath}/css/jquery.plupload.queue.css" rel='stylesheet' type='text/css' />
</head>
<body>
	<div>
		<div id="uploader">
			<p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
		</div>
		<form method="post" action="${cxtPath}/updateMovie"
			enctype="multipart/form-data">
			<div class="register-top-grid">
				<input type="hidden" name="userId" value="${user.id}" />
				<div>
					<span><font color="#FFFFFF" size="4">缩略图</font><label></label></span>
					<input type="file" name="moviePicture" />
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">名称</font><label></label></span>
					<input type="text" name="movieName" placeholder="请输入影片名称">
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">国家/地区</font><label></label></span>
					<input type="text" name="movieCountry" placeholder="请输入国家/地区">
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">时长</font><label></label></span>
					<input type="text" name="option" placeholder="请输入影片时长">
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">类型</font><label></label></span>
					<select class="select" name="categoryId">
						<option selected="selected">请选择类型</option>
						<c:forEach items="${categories}" var="categorie">
							<option value="${categorie.id}">${categorie.categoryName}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">导演</font><label></label></span>
					<input type="text" name="director" placeholder="请输入导演">
				</div>
				<div class="clearfix"></div>
				<div>
					<span><font color="#FFFFFF" size="4">主演</font><label></label></span>
					<input type="text" name="actors" placeholder="请输入主演">
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">上映/首播日期</font><label></label></span>
					<input type="text" name="showTime" placeholder="请输入影片上映/首播日期">
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">描述/简介</font><label></label></span>
					<input type="text" name="message" placeholder="请输入影片描述/简介">
				</div>
				<div>
					<span><font color="#FFFFFF" size="4">推荐指数/评分</font><label></label></span>
					<select class="select" name="grade">
						<option selected="selected">请给影片评分</option>
						<option value="1">1.0分</option>
						<option value="2">2.0分</option>
						<option value="3">3.0分</option>
						<option value="4">4.0分</option>
						<option value="5">5.0分</option>
					</select>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
			<div class="register-but" align="center">
				<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置">
				<div class="clearfix"></div>
			</div>
		</form>
	</div>
</body>
</html>