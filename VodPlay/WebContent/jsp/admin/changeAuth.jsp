<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限修改</title>
</head>
<body>
	<h4>
		<a href="#" onclick="showAtRight('${cxtPath}/authorization')"
					style="margin-left:820px;">返回上一层</a>
	</h4>
	<div align="center">
			<h3>
				权限修改
			</h3>
			<div align="center">
				<form action="${cxtPath}/updateAuth" method="post">
					帐号:<input type="text" value="${result.adminName}" disabled="disabled"><br><br>
					角色:
					<select name="role" style="width: 157px;">
					  <option value ="视频管理员" selected>视频管理员</option>
					  <option value ="用户管理员">用户管理员</option>
					  <option value="系统管理员">系统管理员</option>
					</select>
					<br><br>
					<input type="hidden" name="id" value="${result.id}">
					<input type="submit" value="保存">&nbsp;&nbsp;&nbsp;
					<input type="reset"  value="重置">
				</form>
			</div>
			
	</div>
</body>
</html>