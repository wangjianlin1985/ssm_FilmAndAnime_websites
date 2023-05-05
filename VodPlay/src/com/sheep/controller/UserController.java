package com.sheep.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sheep.pojo.User;
import com.sheep.service.UserService;
import com.sheep.utils.SaveFile;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Resource
	RandomValidateCode code;

	@RequestMapping("/vcode")
	public void vcode(HttpServletRequest request, HttpServletResponse response) {
		code.getRandcode(request, response);
	}

	@RequestMapping("/tologin")
	public String tologin() {
		return "redirect:/index.jsp";
	}

	@RequestMapping("/toRegister")
	public String toRegister() {

		return "redirect:/register.jsp";
	}

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @param session
	 * @param request
	 * @param vcode
	 * @return
	 */
	@RequestMapping("/userLogin")
	public String userLogin(User user, HttpSession session, HttpServletRequest request) {

		User userResult = this.userService.userLogin(user);
		if (null != userResult) {
			session.setAttribute("user", userResult);
			return "redirect:index.jsp";
		}else {
			request.setAttribute("mess", "用户名或者密码错误！");
			return "jsp/admin/error.jsp";
		}
	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	public String userRegister(User user, HttpSession session,
			HttpServletRequest request) throws IOException {
		
		SaveFile.saveDefaultPicture(user,request);
		
		Date date = new Date();
		user.setRegisterDate(date);
		
		user.setUserNickname(user.getUserName());
		int flag = this.userService.userRegister(user);

		if (flag > 0) {
			session.setAttribute("user", user);
			return "redirect:/index.jsp";
		}
		return "redirect:/register.jsp";
	}

	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		session.getAttribute("user");
		session.removeAttribute("user");
		return "redirect:/index.jsp";
	}

	/**
	 * ajax验证码校验
	 * @param session
	 * @param vcode
	 * @return
	 */
	@RequestMapping("/ajaxChcekCode")
	public @ResponseBody Map<String, Object> ajaxChcekCode(HttpSession session,
			@RequestParam(value = "vcode", required = false) String vcode) {

		Map<String, Object> codeMap = new HashMap<String, Object>();
		String sessionCode = (String) session.getAttribute(Constants.RANDOM_CODE_KEY);

		if (null == vcode || "".equals(vcode)) {
			codeMap.put("reg", "null");
		} else if (vcode.equalsIgnoreCase(sessionCode)) {
			codeMap.put("reg", "true");
		} else {
			codeMap.put("reg", "false");
		}
		return codeMap;
	}

	/**
	 * ajax用户名校验：用于登录与注册用户名校验
	 * @param user
	 * @return
	 */
	@RequestMapping("/ajaxChcekUserName")
	public @ResponseBody Map<String, Object> ajaxChcekUserName(User user) {

		boolean ret = this.userService.findUserByUserName(user.getUserName());

		Map<String, Object> userMap = new HashMap<String, Object>();
		if (ret) {
			userMap.put("reg", "true");
		} else {
			userMap.put("reg", "false");
		}
		return userMap;
	}
	
	
	/**
	 * ajax修改密码校验
	 * @param user
	 * @return
	 */
	@RequestMapping("/ajaxChcekUserPassByUserName")
	public @ResponseBody Map<String, Object> ajaxChcekUserPassByUserName(User user) {
		User ret = this.userService.userLogin(user);
		Map<String, Object> userMap = new HashMap<String, Object>();
		if (null!=ret) {
			
			userMap.put("reg", "true");
			
		} else {
			userMap.put("reg", "false");
			
		}
		return userMap;
	}

	
	
	
	/**
	 * 修改用户信息
	 * @param partFile
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("/editUserInfo")
	public String editUserInfo(@RequestParam(value = "userPrices") MultipartFile partFile,
			User user, HttpSession session,HttpServletRequest request) {
		String newPass = request.getParameter("newUserPassword");
		if(null!=newPass&&!"".equals(newPass)) {
			user.setUserPassword(newPass);
		}else {
			user.setUserPassword(null);
		}
		
		if(!partFile.isEmpty()) {
			SaveFile.savePicture(user, partFile);
		}
		User userResult = this.userService.updateUser(user);
		if(null!=userResult) {
			session.setAttribute("user", userResult);
		}
		return "redirect:/jsp/user/editUser.jsp";
	}
	
	
	/**
	 * ajax用户名校验：用于登录与注册用户名校验
	 * @param user
	 * @return
	 */
	@RequestMapping("/ajaxChcekPass")
	public @ResponseBody Map<String, Object> ajaxChcekPass(User user) {

		User userResult = this.userService.userLogin(user);

		Map<String, Object> passMap = new HashMap<String, Object>();
		if (null!=userResult) {
			passMap.put("reg", "true");
		} else {
			passMap.put("reg", "false");
		}
		return passMap;
	}
	
	
}
