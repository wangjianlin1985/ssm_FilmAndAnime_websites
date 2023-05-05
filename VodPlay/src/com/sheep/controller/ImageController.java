package com.sheep.controller;

import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.io.OutputStream;  
import java.util.Random;  
  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;  
  
@Controller  
public class ImageController {  
      
    String[] random = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",  
            "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",  
            "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",  
            "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",  
            "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };  
  
	@RequestMapping("/chkcode")
    public void chkcodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {  
        int width = 130;  
        int height = 50;  
        // 设置响应格式  
        response.setContentType("image/jpeg");  
        // 获得输出流  
        OutputStream os = response.getOutputStream();  
        // 创建图片内存对象 给定长，宽 和格式  
        BufferedImage image = new BufferedImage(width, height,  
                BufferedImage.TYPE_INT_RGB);  
        // 创建画笔  
        Graphics g = image.createGraphics();  
        Random ran = new Random();  
        // 先给画笔设置颜色  
        g.setColor(new Color(ran.nextInt(256), ran.nextInt(256), ran  
                .nextInt(256)));  
        // 画矩形  
        g.fillRect(0, 0, width, height);  
        // 设置字体 Font(String name,int style,int size)指定名称、样式和磅值大小  
        Font font = new Font("宋体", Font.BOLD, 36);  
        g.setFont(font);  
        //最终生成验证码信息  
        StringBuffer sb = new StringBuffer();  
        //定义验证码位置  
        int[] wid = {15,45,75,105};  
        int[] hei = {35,40,30,28};  
        // 绘制四位验证码  
        for(int i=0;i<wid.length;i++){  
            String str = random[ran.nextInt(62)];  
            sb.append(str);  
            g.setColor(new Color(ran.nextInt(256), ran.nextInt(256), ran  
                    .nextInt(256)));  
            g.drawString(str, wid[i], hei[i]);  
        }  
  
        //将验证码发在request中  
        request.setAttribute("chkCode", sb.toString());
        // 绘制干扰线  
        for (int i = 0; i < 6; i++) {  
            g.setColor(new Color(ran.nextInt(256), ran.nextInt(256), ran  
                    .nextInt(256)));  
            g.drawLine(ran.nextInt(width), ran.nextInt(height), ran  
                    .nextInt(width), ran.nextInt(height));  
        }  
  
    /*    // 将位图转为jpeg 格式传输  
        // 使用JPEGImageEncoder 可以一边转换一边输出 把输出流传入  
        JPEGImageEncoder encode = JPEGCodec.createJPEGEncoder(os);  
  
        // 把BufferedImage对象中的图像信息编码后  
        // 向创建该对象(encoder)时指定的输出流输出  
        encode.encode(image); */
    }  
    
}  
