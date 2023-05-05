package com.sheep.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sheep.pojo.User;
import com.sheep.utils.Plupload;
import com.sheep.utils.PluploadService;

@Controller
public class UploadTestController {
	
	/**Plupload文件上传处理方法*/  
    @RequestMapping(value="/toUpload/pluploadUpload")  
    public void upload(Plupload plupload,HttpServletRequest request,
    		HttpServletResponse response,HttpSession session) {  
  
        plupload.setRequest(request);//手动传入Plupload对象HttpServletRequest属性  
  
        User user = (User)request.getSession().getAttribute("user");  
        	
        //文件存储绝对路径,会是一个文件夹，项目相应Servlet容器下的"pluploadDir"文件夹，还会以用户唯一id作划分  
        File dir = new File("E:/myvod/video/"+user.getUserName());  
        if(!dir.exists()){  
            dir.mkdirs();//可创建多级目录，而mkdir()只能创建一级目录  
        }  
        //开始上传文件  
        PluploadService.upload(plupload, dir,session);  
    }  
	
}
