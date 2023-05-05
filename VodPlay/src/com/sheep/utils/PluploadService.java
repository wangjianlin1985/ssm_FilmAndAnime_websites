package com.sheep.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class PluploadService {
	 public static void upload(Plupload plupload,
			 File pluploadDir,HttpSession session){ 
			UUID uuid = UUID.randomUUID();
			String[] fileNames = plupload.getName().split("\\.");
	        String fileName =uuid.toString()+"."+fileNames[1];//在服务器内生成唯一文件名  
	        session.setAttribute("uuid", uuid.toString());
	        session.setAttribute("exMv", fileNames[1]);
	        upload(plupload,pluploadDir,fileName);  
	    }  
	  
	    private static void upload(Plupload plupload,File pluploadDir,String fileName){  
	  
	        int chunks = plupload.getChunks();//用户上传文件被分隔的总块数  
	        int nowChunk = plupload.getChunk();//当前块，从0开始  
	  
	        //这里Request请求类型的强制转换可能出错，配置文件中向SpringIOC容器引入multipartResolver对象即可。  
	        MultipartHttpServletRequest multipartHttpServletRequest  = (MultipartHttpServletRequest)plupload.getRequest();  
	        //调试发现map中只有一个键值对  
	        MultiValueMap map = multipartHttpServletRequest.getMultiFileMap();  
	  
	        if(map!=null){  
	            try{  
	                Iterator iterator = map.keySet().iterator();  
	                while(iterator.hasNext()){  
	  
	                    String key = (String) iterator.next(); 
	                    List<MultipartFile> multipartFileList = (List<MultipartFile>) map.get(key);  
	  
	                    for(MultipartFile multipartFile:multipartFileList){//循环只进行一次  
	  
	                        plupload.setMultipartFile(multipartFile);//手动向Plupload对象传入MultipartFile属性值  
	                        File targetFile = new File(pluploadDir+"/"+fileName);//新建目标文件，只有被流写入时才会真正存在  
	                        if(chunks>1){//用户上传资料总块数大于1，要进行合并  
	  
	                            File tempFile = new File(pluploadDir.getPath()+"/"+multipartFile.getName());  
	                            //第一块直接从头写入，不用从末端写入  
	                            savePluploadFile(multipartFile.getInputStream(),tempFile,nowChunk==0?false:true);  
	  
	                            if(chunks-nowChunk==1){//全部块已经上传完毕，此时targetFile因为有被流写入而存在，要改文件名字  
	                                tempFile.renameTo(targetFile);  
	                            }  
	                        }  
	                        else{  
	                            //只有一块，就直接拷贝文件内容  
	                            multipartFile.transferTo(targetFile);  
	                        }  
	                    }  
	                }  
	            }  
	            catch (IOException e){  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
	    private static void savePluploadFile(InputStream inputStream,File tempFile,boolean flag){  
	        OutputStream outputStream = null;  
	        try {  
	            if(flag==false){  
	                //从头写入  
	                outputStream = new BufferedOutputStream(new FileOutputStream(tempFile));  
	            }  
	            else{  
	                //从末端写入  
	                outputStream = new BufferedOutputStream(new FileOutputStream(tempFile,true));  
	            }  
	            byte[] bytes = new byte[1024];  
	            int len = 0;  
	            while ((len = (inputStream.read(bytes)))>0){  
	                outputStream.write(bytes,0,len);  
	            }  
	        }  
	        catch (FileNotFoundException e){  
	            e.printStackTrace();  
	        }  
	        catch (IOException e){  
	            e.printStackTrace();  
	        }  
	        finally {  
	            try{  
	                outputStream.close();  
	                inputStream.close();  
	            }  
	            catch (IOException e){  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
}
