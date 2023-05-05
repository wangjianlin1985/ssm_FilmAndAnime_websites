var phonePattern = /^((\d2,3)|(\d{3}\-))?(0\d2,3|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/;

// 取得XMLHttpRequest对象是AJAX的要点
// 此getXMLRequest()方法是根据不同浏览器来取得XMLHttpRequest对象
function getXMLRequest() {
	var request;
	try {
		// for火狐等浏览器
		request = new XMLHttpRequest();
	} catch (e) {
		try {
			// for IE
			request = new ActiveXObject("Microsoft.XMLHttp");
		} catch (e) {
			alert("您的浏览器不支持AJAX!!!");
			return;
		}
	}
	return request;
}

// 此checkcode()方法是更换验证码图片的要点
function checkcode() {
	var request = getXMLRequest();// 得到XMLHttpRequest对象
	request.onreadystatechange = function() {
		document.getElementById("code").src = "vcode";// 改变验证码图片
	}
	// 将请求发送出去
	request.open("GET", "vcode", true);
	request.send();
}

// 用户登录 表单信息验证
function check(form) {
	var pass = $("#userPassword_span").text();
	var code = $("#vodespan").text();
	var name = $("#username_span").text();

	if (form.userName.value == '' || name == "用户名不存在!") {
		form.userName.focus();
		return false;
	}
	if (form.vcode.value == '' || code == "验证码错误!") {
		form.vcode.focus();
		return false;
	}
	if (form.userPassword.value == '' || pass == "用户名与密码不匹配!") {
		form.userPassword.focus();
		return false;
	}
	return true;
}

//注册 表单信息验证
function reCheck(form) {

	if (form.userName.value == '' || name == "用户名已存在！") {
		form.userName.focus();
		return false;
	}
	if (form.phone.value == '' || phone == "格式不正确！") {
		form.phone.focus();
		return false;
	}

	/*
	if (form.userPassword.value == '' || pass == "密码格式不正确！") {
		form.userPassword.focus();
		return false;
	}*/

	if (form.reUserPassword.value == '' || repass == "密码不一致!") {
		form.reUserPassword.focus();
		return false;
	}

	if (form.vcode.value == '' || code == "验证码错误!") {
		form.vcode.focus();
		return false;
	}

	return true;
}

// AJAX异步操作
$(function() {
	$("#userName").blur(function() { // 当xxx失去焦点时
		var userNameValue = $("#userName").val();
		if (userNameValue != "") {
			$.ajax({
				url : "/VodPlay/ajaxChcekUserName", // 要请求的服务器url
				// 这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
				// data:{method:"ajaxTest",val:value},
				data : {
					userName : userNameValue
				}, // 这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
				async : true, // 是否为异步请求
				cache : false, // 是否缓存结果
				type : "POST", // 请求方式为POST
				dataType : "json", // 服务器返回的数据是什么类型
				success : function(result) { // 这个方法会在服务器执行成功是被调用
					// ，参数result就是服务器返回的值(现在是json类型)
					var resultReg = result.reg;
					if (resultReg == "false") {
						$("#username_span").text("用户名不存在!");
					} else {
						$("#username_span").text("✔");
					}
				}
			})
		} else {
			$("#username_span").text("请输入用户名");
		}
	})

	// 登录ajax校验密码
	$("#userPassword").blur(function() { // 当xxx失去焦点时
		var userPasswordValue = $("#userPassword").val();
		var userNameValue = $("#userName").val();
		if (userPasswordValue != "" && null != userNameValue) {
			$.ajax({
				url : "/VodPlay/ajaxChcekPass", // 要请求的服务器url
				// 这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
				// data:{method:"ajaxTest",val:value},
				data : {
					userPassword : userPasswordValue,
					userName : userNameValue
				}, // 这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
				async : true, // 是否为异步请求
				cache : false, // 是否缓存结果
				type : "POST", // 请求方式为POST
				dataType : "json", // 服务器返回的数据是什么类型
				success : function(result) { // 这个方法会在服务器执行成功是被调用
					// ，参数result就是服务器返回的值(现在是json类型)
					var resultReg = result.reg;
					if (resultReg == "false") {
						$("#userPassword_span").text("用户名与密码不匹配!");
					} else {
						$("#userPassword_span").text("✔");
					}
				}
			})
		}
	})

	// 修改密码ajax校验
	$("#edPass").blur(function() { // 当xxx失去焦点时
		var edPassValue = $("#edPass").val();
		var userNameValue = $("#hdUserName").val();
		if (edPassValue != "" && null != edPassValue) {
			$.ajax({
				url : "/VodPlay/ajaxChcekUserPassByUserName", // 要请求的服务器url
				// 这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
				// data:{method:"ajaxTest",val:value},
				data : {
					userName : userNameValue,
					userPassword : edPassValue
				}, // 这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
				async : true, // 是否为异步请求
				cache : false, // 是否缓存结果
				type : "POST", // 请求方式为POST
				dataType : "json", // 服务器返回的数据是什么类型
				success : function(result) { // 这个方法会在服务器执行成功是被调用
					// ，参数result就是服务器返回的值(现在是json类型)
					var resultReg = result.reg;
					if (resultReg == "false") {
						$("#edPass_span").text("旧密码错误");
					} else {
						$("#edPass_span").text("✔");
					}
				}
			})
		} else {
			$("#edPass_span").text("请输入旧密码");
		}
	})

	// 登录注册验证码校验
	$("#codeid").blur(function() { // 当xxx失去焦点时
		var vcodeValue = $("#codeid").val();
		$.ajax({
			url : "ajaxChcekCode", // 要请求的服务器url
			// 这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
			// data:{method:"ajaxTest",val:value},
			data : {
				vcode : vcodeValue
			}, // 这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
			async : true, // 是否为异步请求
			cache : false, // 是否缓存结果
			type : "POST", // 请求方式为POST
			dataType : "json", // 服务器返回的数据是什么类型
			success : function(result) { // 这个方法会在服务器执行成功是被调用
				// ，参数result就是服务器返回的值(现在是json类型)
				var resultReg = result.reg;
				if (resultReg == "null") {
					$("#vodespan").text("请输入验证码!");
				} else if (resultReg == "true") {
					$("#vodespan").text("✔");
				} else {
					$("#vodespan").text("验证码错误!");
				}
			}
		})
	})

	// 登录验证码校验
	$("#userPassword").blur(function() { // 当xxx失去焦点时
		var userPasswordValue = $("#userPassword").val();
		var len = userPasswordValue.length
		if (userPasswordValue == "") {
			$("#userPassword_span").text("请输入密码!");
		} else {
			$("#userPassword_span").text("");
		}
	})

	// 注册校验

	// 用户名校验
	$("#reUserName").blur(function() { // 当xxx失去焦点时
		var userNameValue = $("#reUserName").val();
		if (userNameValue == "") {
			$("#ReNameSpan").text("请输入用户名");
		} else if (!(/^[a-zA-Z0-9_-]{4,12}$/.test(userNameValue))) {
			$("#ReNameSpan").text("格式不正确！");
		} else {
			$.ajax({
				url : "/VodPlay/ajaxChcekUserName", // 要请求的服务器url
				// 这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
				// data:{method:"ajaxTest",val:value},
				data : {
					userName : userNameValue
				}, // 这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
				async : true, // 是否为异步请求
				cache : false, // 是否缓存结果
				type : "POST", // 请求方式为POST
				dataType : "json", // 服务器返回的数据是什么类型
				success : function(result) { // 这个方法会在服务器执行成功是被调用
					// ，参数result就是服务器返回的值(现在是json类型)
					var resultReg = result.reg;
					if (resultReg == "false") {
						$("#ReNameSpan").text("✔");
					} else {
						$("#ReNameSpan").text("用户名已存在！");
					}
				}
			})
		}
	})

	// 昵称校验
	$("#userNickname").blur(function() { // 当xxx失去焦点时
		var userNickname = $("#userNickname").val();
		if (userNickname == "") {
			$("#nickSpan").text("请输入昵称！");
		} else {
			$("#nickSpan").text("✔");
		}
	})

	// 手机号码校验
	$("#phone").blur(function() { // 当xxx失去焦点时
		var phone = $("#phone").val();
		if (phone == "") {
			$("#phoneSpan").text("请输入手机号码！");
		} else if (!(/^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/.test(phone))) {
			$("#phoneSpan").text("格式不正确！");
		} else {
			$("#phoneSpan").text("✔");
		}
	})

	// 密码校验
	$("#userPassword")
			.blur(
					function() { // 当xxx失去焦点时
						var userPasswordValue = $("#userPassword").val();
						if (userPasswordValue == "") {
							$("#RePassSpan").text("密码不能为空!");
						} else if (!(/^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/
								.test(userPasswordValue))) {
							$("#RePassSpan").text("密码格式不正确！");
						} else {
							$("#RePassSpan").text("ok");
							$("#reUserPassword").blur(function() { // 当xxx失去焦点时
								var userPass = $("#userPassword").val();
								var rePass = $("#reUserPassword").val();
								if (rePass != '') {
									if (userPass != rePass) {
										$("#confirRePassSpan").text("密码不一致!");
									} else {
										$("#confirRePassSpan").text("✔");
									}
								}
							})

						}
					})

	// 修改用户信息之密码校验
	$("#reEdPass")
			.blur(
					function() { // 当xxx失去焦点时
						var userPasswordValue = $("#reEdPass").val();
						if (userPasswordValue == "") {
							$("#reEdPass_Span").text("密码不能为空!");
						} else if (!(/^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/
								.test(userPasswordValue))) {
							$("#reEdPass_Span").text("格式不正确！");
						} else {
							$("#reEdPass_Span").text("ok");
							$("#confEdPass").blur(function() { // 当xxx失去焦点时
								var userPass = $("#reEdPass").val();
								var rePass = $("#confEdPass").val();
								if (rePass != '') {
									if (userPass != rePass) {
										$("#confEdPass_span").text("密码不一致!");
									} else {
										$("#confEdPass_span").text("ok");
									}
								}
							})

						}
					})

});

function sub() {
	var rePass = $("#checkbox").prop("checked");
	if (rePass == "true") {
		alert("sasa");
	} else {
		$("#reForm").submit()
	}
}

function checkpwd() {

	var newPass1 = document.lform.newPass1.value;// 获取密码框的值
	var newPass2 = document.lform.newPass2.value;// 获取重新输入的密码值
	if (newPass1 == "") {
		document.getElementById("newTips2").innerHTML = "<font color='red'>密码不嫩为空</font>";
		// alert("请输入密码！");//检测到密码为空，提醒输入//
		document.lform.newPass1.focus();// 焦点放到密码框
		return false;// 退出检测函数
	}// 如果允许空密码，可取消这个条件

	if (newPass1 != newPass2) {// 判断两次输入的值是否一致，不一致则显示错误信息
		document.getElementById("newTips2").innerHTML = "<font color='red'>两次输入密码不一致</font>";// 在div显示错误信息
		return false;
	} else {
		// 密码一致，可以继续下一步操作
		document.getElementById("newTips2").innerHTML = "<font color='greem'>输入密码一致</font>";
	}
}