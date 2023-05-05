<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>首页导航</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			window.location.href = "${cxtPath}/showIndex";
		});
	</script>
</body>
</html>