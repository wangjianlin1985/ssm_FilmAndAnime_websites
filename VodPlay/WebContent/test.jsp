<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cxtPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证码测试</title>

<script type="text/javascript">
	//取得XMLHttpRequest对象是AJAX的要点  
	//此getXMLRequest()方法是根据不同浏览器来取得XMLHttpRequest对象  
	function getXMLRequest() {
		var request;
		try {
			//for火狐等浏览器  
			request = new XMLHttpRequest();
		} catch (e) {
			try {
				//for IE  
				request = new ActiveXObject("Microsoft.XMLHttp");
			} catch (e) {
				alert("您的浏览器不支持AJAX!!!");
				return;
			}
		}
		return request;
	}

	//此checkcode()方法是更换验证码图片的要点  
	function checkcode() {
		var request = getXMLRequest();//得到XMLHttpRequest对象  
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				document.getElementById("code").src = "ImageAction";//改变验证码图片  
			}
		}
		//将请求发送出去  
		request.open("GET", "ImageAction", true);
		request.send();
	}
</script>

</head>

<body>
	<img id="code" src="${cxtPath}/ImageAction" onclick="checkcode()"><br> 
	
	<form action="${cxtPath}/getCode">
		<input type="text" name="code" value="" /> <input type="submit"
			value="提交" />
	</form>
</body>

</html>
