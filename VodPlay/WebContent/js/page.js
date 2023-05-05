//全选
function checkAll(checkall) {
	var arr = document.getElementsByName('ids');
	if (checkall.checked == true) {
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = true;
		}
	} else {
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = false;
		}
	}
}

// 反选
function Reverse(reverse) {
	var arr = document.getElementsByName('ids');
	if (reverse.checked == true) {
		for (i = 0; i < arr.length; i++) {
			if ((arr[i]).checked == false) {
				arr[i].checked = true;
			} else {
				arr[i].checked = false;
			}
		}
	} else {
		for (i = 0; i < arr.length; i++) {
			if ((arr[i]).checked == true) {
				arr[i].checked = false;
			} else {
				arr[i].checked = true;
			}
		}
	}
}

$(function() {
	$("#deletebtn").click(function() {
		document.forms[0].action = "${cxtPath}/deleteBook";
		document.forms[0].submit();
	})
})

function toPage(number) {
	$("input[type='hidden']").attr("value",number);
	document.forms[0].action = "getMoviesByUserID";
	document.forms[0].submit();
}

function toPageSearchIndex(number) {
	$("#hidecurrentPage").val(number);
	document.forms[1].action = "searchIndexMovie";
	document.forms[1].submit();
}

function toPageSearchPerson(number) {
	$("#hidecurrentPage").val(number);
	document.forms[1].action = "searchMovie";
	document.forms[1].submit();
}

function toPages(number,category) {
	$("input[type='hidden']").attr("value",number);
	document.forms[0].action = "getMovieByCategory?category="+category;
	document.forms[0].submit();
}