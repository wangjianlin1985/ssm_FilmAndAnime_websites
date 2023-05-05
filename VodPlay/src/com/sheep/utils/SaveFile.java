package com.sheep.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sheep.pojo.Admin;
import com.sheep.pojo.Movie;
import com.sheep.pojo.User;

public class SaveFile {

	public static void savePicture(User user,MultipartFile partFile) {
		
		String fileName = partFile.getOriginalFilename();
		String uploadfilePath = "E:/myvod/img/" + user.getUserName();
		// 新建File对象，作为目标文件对象
		// 路径名/fileName
		String[] imgExtNames = fileName.split("\\.");
		//设置图片的后缀名
		user.setUserPrice("." + imgExtNames[1]);

		File destFile = new File(uploadfilePath, user.getUserName());

		if (!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		File pricePath = new File(uploadfilePath + File.separator + user.getUserName() + user.getUserPrice());
		try {
			partFile.transferTo(pricePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveMvPicture(User user,MultipartFile partFile,Movie movie) {
		
		String fileName = partFile.getOriginalFilename();
		String uploadfilePath = "E:/myvod/img/" + user.getUserName();
		// 新建File对象，作为目标文件对象
		// 路径名/fileName
		String[] imgExtNames = fileName.split("\\.");
		//设置图片的后缀名
		movie.setImgType("."+imgExtNames[1]);

		File destFile = new File(uploadfilePath, user.getUserName());

		if (!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		File pricePath = new File(uploadfilePath + File.separator + movie.getId() + movie.getImgType());
		try {
			partFile.transferTo(pricePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void saveDefaultPicture(User user,HttpServletRequest request) {
		String fileName = "p1.png";
		String uploadfilePath = "E:/myvod/img/" + user.getUserName();
		String[] imgExtNames = fileName.split("\\.");
		//设置图片的后缀名
		user.setUserPrice("." + imgExtNames[1]);
		
		File destFile = new File(uploadfilePath, user.getUserName());

		if (!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		File pricePath = new File(uploadfilePath + File.separator + user.getUserName() + user.getUserPrice());
		try {
			int byteread = 0;
			String webFile = request.getContextPath();
			String path = webFile+"images/p1.png";
			File oldfile = new File(path);
			if (oldfile.exists()) { // 文件存在时
				InputStream inStream = new FileInputStream(path); // 读入原文件
				FileOutputStream fs = new FileOutputStream(pricePath);
				byte[] buffer = new byte[1444];
				while ((byteread = inStream.read(buffer)) != -1) {
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
				fs.close();
			}
		} catch (Exception e) {
			System.out.println("复制单个文件操作出错");
			e.printStackTrace();
		}
	}
	public static void saveDefaultMVPicture(User user,Movie movie,HttpServletRequest request) {
		String fileName = "defMV.jpg";
		String uploadfilePath = "E:/myvod/img/" + user.getUserName();
		String[] imgExtNames = fileName.split("\\.");
		//设置图片的后缀名
		movie.setImgType("." + imgExtNames[1]);
		
		File destFile = new File(uploadfilePath, user.getUserName());
		
		if (!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		File pricePath = new File(uploadfilePath + File.separator + movie.getId() + movie.getImgType());
		try {
			int byteread = 0;
			String webFile = request.getContextPath();
			String path = webFile+"images/defMV.jpg";
			File oldfile = new File(path);
			if (oldfile.exists()) { // 文件存在时
				InputStream inStream = new FileInputStream(path); // 读入原文件
				FileOutputStream fs = new FileOutputStream(pricePath);
				byte[] buffer = new byte[1444];
				while ((byteread = inStream.read(buffer)) != -1) {
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
				fs.close();
			}
		} catch (Exception e) {
			System.out.println("复制单个文件操作出错");
			e.printStackTrace();
		}
	}
	
	
public static void saveSilderPicture(Admin admin,MultipartFile partFile,Movie movie) {
		
		String fileName = partFile.getOriginalFilename();
		String uploadfilePath = "E:/myvod/img/" + admin.getAdminName();
		// 新建File对象，作为目标文件对象
		// 路径名/fileName
		String[] imgExtNames = fileName.split("\\.");
		//设置图片的后缀名
		movie.setSliderImage("."+imgExtNames[1]);

		File destFile = new File(uploadfilePath, admin.getAdminName());

		if (!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		File pricePath = new File(uploadfilePath + File.separator + movie.getId() + movie.getSliderImage());
		try {
			partFile.transferTo(pricePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
