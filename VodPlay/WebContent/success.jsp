<%@page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>使用XMLHttpRequest上传文件</title>
<script type="text/javascript">
    var xhr = new XMLHttpRequest();
     
    //监听选择文件信息
    function fileSelected() {
        //HTML5文件API操作
          var file = document.getElementById('file').files[0];
          if (file) {
            var fileSize = 0;
            if (file.size > 1024 * 1024)
              fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
            else
              fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
 
            document.getElementById('fileName').innerHTML = 'Name: ' + file.name;
            document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
            document.getElementById('fileType').innerHTML = 'Type: ' + file.type;
          }
        }
     
    function uploadMaxFile(){
    	var testxhr = new XMLHttpRequest();
    	var file = document.getElementById('file').files[0];
    	if (file) {
    		var fd = new FormData();
            fd.append("fileName", file.name);
            fd.append("fileSize", file.size);
            
            testxhr.onload = function(evt){
            	var start = parseInt(JSON.parse(evt.target.responseText).uploadSize);
            	uploadFile(file,start);
            };
            testxhr.open("POST", "<%=path%>/getUploadedSize");
            testxhr.send(fd);
    		
    	}    	
    }
    
    //上传文件
    function uploadFile(file,start) {
          var fd = new FormData();
          //关联表单数据,可以是自定义参数
          fd.append("fileName", file.name);
          fd.append("fileSize", file.size);
          var end = start + 1024*1024;//文件分片上传，每片1M
          var endFlag = false;
          if(end>=file.size){
        	  end = file.size;
        	  endFlag = true;
          }
          fd.append("file", file.slice(start,end));
          fd.append("uploadSize", end);
 
          //监听事件
          //xhr.upload.addEventListener("progress", uploadProgress, false);
          //xhr.addEventListener("load", uploadComplete, false);
          xhr.addEventListener("error", uploadFailed, false);
          xhr.addEventListener("abort", uploadCanceled, false);
          xhr.onload = function(evt){
        	  if(!endFlag){
      		  	  uploadFile(file,end);
        	  }
          };
          xhr.upload.addEventListener("progress", function(evt){
        	    if (evt.lengthComputable) {
	      			//var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	      			var percentComplete = Math.round((evt.loaded+start) * 100 / file.size);
	      			document.getElementById('progressNumber').innerHTML = percentComplete
	      					.toString()
	      					+ '%';
	      		} else {
	      			document.getElementById('progressNumber').innerHTML = 'unable to compute';
	      		}
          }, false);
          //发送文件和表单自定义参数
          xhr.open("POST", "<%=path%>/doUpload");
		  xhr.send(fd);
	}
	//取消上传
	function cancleUploadFile() {
		xhr.abort();
	}

	//上传进度
	function uploadProgress(evt) {
		if (evt.lengthComputable) {
			var percentComplete = Math.round(evt.loaded * 100 / evt.total);
			document.getElementById('progressNumber').innerHTML = percentComplete
					.toString()
					+ '%';
		} else {
			document.getElementById('progressNumber').innerHTML = 'unable to compute';
		}
	}

	//上传成功响应
	function uploadComplete(evt) {
		//服务断接收完文件返回的结果
		alert(evt.target.responseText);
	}

	//上传失败
	function uploadFailed(evt) {
		alert("上传失败");
	}
	//取消上传
	function uploadCanceled(evt) {
		alert("您取消了本次上传.");
	}
</script>
</head>
<body>
	<form id="form1" enctype="multipart/form-data" method="post"
		action="upload.php">
		<div class="row">
			<label for="fileToUpload">选择文件</label> <input type="file"
				name="file" id="file" onchange="fileSelected();" />
		</div>
		<div id="fileName"></div>
		<div id="fileSize"></div>
		<div id="fileType"></div>
		<div class="row">
			 <input type="button"
				onclick="uploadMaxFile()" value="上传" /> <input type="button"
				onclick="cancleUploadFile()" value="取消" />
		</div>
		<div id="progressNumber"></div>
	</form>

</body>
</html>