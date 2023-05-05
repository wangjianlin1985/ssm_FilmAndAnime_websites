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
	<div>
			<h3 align="center">
				权限管理
				<%-- 
				<a href="#" onclick="showAtRight('${cxtPath}/authorization')"
					style="margin-left:820px;">返回上一层</a>
				 --%>
			</h3>
				<table border="1px" width="50%" style="font-size: 16px;"
					align="center">
					<tr align="center">
						<th width="33%" style="text-align: center;">账号</th>
						<th width="33%" style="text-align: center;">角色</th>
						<th width="34%" style="text-align: center;">操作</th>
					</tr>
					<c:forEach var="admin" items="${adminList}">
						<tr align="center">
							<td>
								<input type="text" value="${admin.adminName}" 
								disabled="disabled" style="text-align: center;"/>
							</td>
							<td>
								<input type="text" value="${admin.role}" 
								disabled="disabled" style="text-align: center;"/>
							</td>
							<td>
								<c:if test="${admin.adminName=='sa'}">
									<a href="#" onclick="return false" >授权管理</a>
								</c:if>
								<c:if test="${admin.adminName!='sa'}">
									<a href="#" onclick="showAtRight('${cxtPath}/changeAuth?id=${admin.id}')">授权管理</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
	</div>
</body>
</html>