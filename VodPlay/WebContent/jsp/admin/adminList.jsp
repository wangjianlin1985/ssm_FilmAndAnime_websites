<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户列表</title>
</head>
<body>
		<h4>
			<a href="#" onclick="showAtRight('${cxtPath}/jsp/admin/addAdmin.jsp')"
					style="margin-left:820px;">添加新账户</a>
		</h4>
	<div align="center">
			<h3>
				账户列表
			</h3>
			<table border="1px" width="45%" style="font-size: 16px;">
				<tr>
					<th width="15%" style="text-align: center;">账号</th>
					<th width="15%" style="text-align: center;">密码</th>
					<th width="15%" style="text-align: center;">角色</th>
				</tr>
				<c:forEach var="admin" items="${adminList}">
					<tr>
						<td>
							<input type="text" value="${admin.adminName}" 
								disabled="disabled" style="text-align: center;"/>
						</td>
						<td>
							<input type="text" value="${admin.password}" 
								disabled="disabled" style="text-align: center;"/>
						</td>
						<td>
							<input type="text" value="${admin.role}" 
								disabled="disabled" style="text-align: center;"/>
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
</body>
</html>