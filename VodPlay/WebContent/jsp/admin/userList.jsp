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
<title>用户列表</title>
</head>
<body>
	<div>
			<h3>
				用户列表
			</h3>
			<table border="1px" width="100%" style="font-size: 16px;">
				<tr>
					<th width="25%">用户名</th>
					<th width="25%">昵称</th>
					<th width="25%">注册时间</th>
					<th width="25%">电话号码</th>
				</tr>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>
							${user.userName}
						</td>
						<td>
							${user.userNickname}
						</td>
						<td>
							<f:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH:mm:ss"/>
						</td>
						<td>
							${user.phone}
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
</body>
</html>