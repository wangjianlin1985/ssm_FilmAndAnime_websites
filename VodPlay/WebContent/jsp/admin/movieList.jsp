<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="url" value="pictureUrl?url=E:/myvod/img/"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频列表</title>
</head>
<body>
	<div>
			<h3>
				<c:if test="${operation =='silder'}">
					首页轮播管理
					<a href="#" onclick="showAtRight('${cxtPath}/getMovieNoSilder')" 
					style=" margin-left:755px;font-size:1">添加轮播视频</a>
				</c:if>
				<c:if test="${operation !='silder'}">
					<c:if test="${operation == 'movie'}">
						电影管理
					</c:if>
					<c:if test="${operation == 'TVplay'}">
						电视剧管理
					</c:if>
					<c:if test="${operation == 'comic'}">
						动漫管理
					</c:if>
					<c:if test="${operation == 'variety'}">
						综艺管理
					</c:if>
					<a href="${cxtPath}/adminUpload.jsp" 
					style=" margin-left:755px;display:none;">添加视频a</a>
				</c:if>
			</h3>
			<form method="post" action="">
			<table border="1px" width="100%">
				<tr>
					<th width="15%">视频名称</th>
					<th width="8%">国家地区</th>
					<th width="7%">播放次数</th>
					<th width="8%">视频时长</th>
					<th width="20%">视频描述</th>
					<th width="5%">导演</th>
					<th width="28%">演员</th>
					<th width="5%">编辑</th>
					<th width="5%">删除</th>
				</tr>
				<c:forEach var="mv" items="${listMV}">
					<tr>
						<td>
							<a href="${cxtPath}/player?movie=${mv.id}${mv.mvType}"
							class="movie__title">${mv.movieName}</a>
						</td>
						<td>
							${mv.movieCountry}
						</td>
						<td>
							${mv.plays}
						</td>
						<td>
							${mv.option}
						</td>
						<td>
							${mv.message}
						</td>
						<td>
							${mv.director}
						</td>
						<td>
							${mv.actors}
						</td>
						<td>
							<input type="button" value="编辑" onclick="editMovieByAdmin('${mv.id}')">
						</td>
						<td>
							<input type="button" value="删除" onclick="showAtRight('${cxtPath}/changeMovie?movieid=${mv.id}')">
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${operation !='silder'}">
			<br>
			<!--分页按钮-->
			<input type="button" class="pagebtn" value="第一页" 
				onclick="showAtRight('${cxtPath}/movieList?currentPage=1&operation=${operation}')" />
			- <input type="button" class="pagebtn" value="上一页"
				onclick="showAtRight('${cxtPath}/movieList?currentPage=${movie.currentPage-1}&operation=${operation}')" /> - <input
				type="button" class="pagebtn" value="当前页:${movie.currentPage}" disabled="disabled"/> - <input type="button" class="pagebtn" value="下一页"
				onclick="showAtRight('${cxtPath}/movieList?currentPage=${movie.currentPage+1}&operation=${operation}')"/> - <input
				type="button" class="pagebtn" value="尾    页"
				onclick="showAtRight('${cxtPath}/movieList?currentPage=${movie.totalPage}&operation=${operation}')"/> - <input type="text"
				class="page" value="共 ${movie.totalPage} 页    跳转到第" size="16"
				disabled="disabled" /> - <input type="text"
				value="${movie.currentPage}" id="currentPage" class="pageValue"
				size="2"  onblur="showAtRight('${cxtPath}/movieList?currentPage='+this.value+'&operation=${operation}')" /> - <input
				type="button" class="pagebtn" value="页    go" /> <input
				type="hidden" name="currentPage" id="hidecurrentPage"
				value="${movie.currentPage}" />
			</c:if>
			</form>
	</div>
</body>
</html>