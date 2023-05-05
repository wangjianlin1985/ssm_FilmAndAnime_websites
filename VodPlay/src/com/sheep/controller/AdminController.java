package com.sheep.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sheep.pojo.Admin;
import com.sheep.pojo.Movie;
import com.sheep.pojo.User;
import com.sheep.service.AdminService;
import com.sheep.service.MovieService;
import com.sheep.service.UserService;
import com.sheep.utils.SaveFile;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 检测后台是否登录
	 * @param admin
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkAdmin")
	public String checkAdmin(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if(null!=admin) {
			return "redirect:jsp/admin/index.jsp";
		}else {
			return "redirect:jsp/admin/adminLogin.jsp";
		}
	}
	
	/**
	 * 后台登录
	 * @param admin
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/adminLogin")
	public String adminLogin(Admin admin,HttpSession session,HttpServletRequest request) {
		Admin adminResult = this.adminService.adminLogin(admin);
		if (null != adminResult) {
			session.setAttribute("admin", adminResult);
			return "redirect:jsp/admin/index.jsp";
		} else {
			request.setAttribute("mess", "验证失败！请注意角色、用户名和密码是否匹配！");
			return "jsp/admin/error.jsp";
		}
	}
	
	/**
	 * 后台退出登录
	 */
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
		session.getAttribute("admin");
		session.removeAttribute("admin");
		return "redirect:jsp/admin/adminLogin.jsp";
	}

	
	/**
	 * 查询用户列表
	 * @param admin
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/userList")
	public String userList(Admin admin,HttpSession session,HttpServletRequest request) {
		return "jsp/admin/userList.jsp";
	}
	
	/**
	 * 查询视频列表
	 * @param admin
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/movieList")
	public String movieList(Admin admin,Movie movie,HttpSession session,HttpServletRequest request) {
		String operation = request.getParameter("operation");
		if(operation.equals("silder")) {//轮播
			List<Movie> listMV = this.adminService.getMovieBySlider();
			request.setAttribute("listMV", listMV);
			request.setAttribute("operation", "silder");
		}else {
			if(operation.equals("movie")) {//电影
				movie.setCategoryId(1l);
				request.setAttribute("operation", "movie");
			}else if(operation.equals("TVplay")){//电视剧
				movie.setCategoryId(2l);
				request.setAttribute("operation", "TVplay");
			}else if(operation.equals("comic")){//动漫
				movie.setCategoryId(3l);
				request.setAttribute("operation", "comic");
			}else {//综艺
				movie.setCategoryId(4l);
				request.setAttribute("operation", "variety");
			}
			
			List<Movie> listMV = this.movieService.getMoviesByUserID(movie);
			request.setAttribute("listMV", listMV);
		}
		return "jsp/admin/movieList.jsp";
	}
	
	/**
	 * 将轮播视频下架
	 * @param admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/changeMovie")
	public String changeMovie(Admin admin,HttpServletRequest request) {
		Movie movie = new Movie();
		movie.setId(request.getParameter("movieid"));
		movie.setSliderImage("");
		this.movieService.updateByCondiction(movie);
		return "redirect:movieList?operation=slider";
	}
	
	/**
	 * 查找所有不是轮播的视频
	 * @param movie
	 * @param request
	 * @return
	 */
	@RequestMapping("/getMovieNoSilder")
	public String getMovieNoSilder(Movie movie,HttpServletRequest request) {
		List<Movie> lmv = this.movieService.getMovieNoSilder(movie);
		request.setAttribute("lmv", lmv);
		return "jsp/admin/addSilderList.jsp";
	}
	
	/**
	 * 去uploadSilderImage.jsp页
	 */
	@RequestMapping("/gotoUploadSilderImage")
	public String gotoUploadSilderImage(HttpServletRequest request) {
		String movieId = request.getParameter("movieId");
		request.setAttribute("movieId", movieId);
		return "jsp/admin/uploadSilderImage.jsp";
	}
	/**
	 * 上传首页轮播图片
	 */
	@RequestMapping("/uploadSilderImage")
	public String uploadSilderImage(Movie movie,HttpSession session,
			@RequestParam(value = "silderPrices") MultipartFile silderPrices,
			HttpServletRequest request) {
		Admin admin = (Admin) session.getAttribute("admin");
		if(!silderPrices.isEmpty()) {
			SaveFile.saveSilderPicture(admin, silderPrices, movie);
		}
		movie.setSliderImage(".jpg");
		this.movieService.updateByCondiction(movie);
		return "checkAdmin";
	}
	
	/**
	 * 获取用户列表
	 */
	@RequestMapping("/getUserList")
	public String getUserList(HttpServletRequest request) {
		List<User> userList = this.userService.getUserList();
		request.setAttribute("userList", userList);
		return "jsp/admin/userList.jsp";
	}
	
	/**
	 * 获取用户视频列表
	 */
	@RequestMapping("/getUserMovies")
	public String getUserMovies(Movie movie,HttpServletRequest request) {
		List<Movie> movies = this.movieService.getUserMovies(movie);
		request.setAttribute("movies", movies);
		return "jsp/admin/userMovieList.jsp";
	}
	
	/**
	 * 获取账户列表
	 */
	@RequestMapping("/getAdminList")
	public String getAdminList(HttpServletRequest request) {
		List<Admin> adminList = this.adminService.getAdminList();
		request.setAttribute("adminList", adminList);
		return "jsp/admin/adminList.jsp";
	}
	
	
	/**
	 * 新增帐户
	 */
	@RequestMapping("/addAdmin")
	public String addAdmin(Admin admin,HttpServletRequest request) {
		this.adminService.addAdmin(admin);
		return "redirect:checkAdmin";
	}
	
	/**
	 * 获取账户列表
	 */
	@RequestMapping("/authorization")
	public String authorization(HttpServletRequest request) {
		List<Admin> adminList = this.adminService.getAdminList();
		request.setAttribute("adminList", adminList);
		return "jsp/admin/authorization.jsp";
	}
	
	
	/**
	 * 获取账户信息
	 */
	@RequestMapping("/changeAuth")
	public String changeAuth(Admin admin,HttpServletRequest request) {
		Admin result = this.adminService.getAdminById(admin);
		request.setAttribute("result", result);
		return "jsp/admin/changeAuth.jsp";
	}
	
	/**
	 * 修改账户权限
	 */
	@RequestMapping("/updateAuth")
	public String updateAuth(Admin admin,HttpServletRequest request) {
		this.adminService.updateAuth(admin);
		return "redirect:checkAdmin";
	}
	
	
	
}
