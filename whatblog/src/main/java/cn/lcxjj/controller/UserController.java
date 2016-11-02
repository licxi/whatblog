package cn.lcxjj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lcxjj.pojo.User;
import cn.lcxjj.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("toLogin.do")
	public String toLogin(Model model){
		model.addAttribute("type", 1);
		return "user/login_register";
	}
	
	@RequestMapping("getUeditorContent.do")
	public String getUeditorContent(String content,Model model){
		model.addAttribute("content", content);
		return "user/showUeditorContent";
	}
	
	
	@RequestMapping("test.do")
	public String test(){
		//return "user/show_blog_for_reader";
		//return "user/user_info";
		//return "article/write_article";
		//return "article/show_article";
		//return "user_blog/blog_home";
		//return "user_blog/user_info";
		//return "user_blog/massage";
		return "user_blog/follow";
	}
	
	@RequestMapping("toReg.do")
	public String toReg(Model model){
		model.addAttribute("type", 0);
		return "user/login_register";
	}
	
	@ResponseBody
	@RequestMapping("checkUserName.do")
	public Map<String,String> checkUserName(String userName){
		Map<String,String> map = new HashMap<String,String>();
		int result = userService.checkUserName(userName);
		if(result == 0){
			//用户存在，可以注册
			map.put("code","ok");
		} else {
			map.put("code", "error");
		}
		return map;
	}
	
	
	
	
	@RequestMapping(value="reg.do",method=RequestMethod.POST)
	public String reg(User user){
		//System.out.println(user);
		boolean result = false;
		if(userService.checkUserName(user.getUserName())==0){ //防止用户重复提交
			result = userService.register(user);
		}else{
			return "redirect:toLogin.do";
		}
		if(result){
			return "main/reg_success";
		}else{
			return "redirect:toReg.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="doLogin.do",method=RequestMethod.POST)
	public Map<String, String> doLogin(HttpServletRequest request,String username,String password){
		Map<String,String> map = new HashMap<String,String>();
		HttpSession session = request.getSession();
		int result = userService.login(username, password);
		if(result == -1){
			map.put("code", "error");
			map.put("msg", "账号错误");
		} else if(result == 0){
			map.put("code", "error");
			map.put("msg", "密码错误");
		} else if(result == 1){
			map.put("code", "ok");
			map.put("msg", "登录成功");
			map.put("callback", request.getContextPath()+"/");
			User user = userService.selectByUserName(username);
			System.err.println(user);
			session.setAttribute("user_name", username);
			session.setAttribute("nickname", user.getNickname());
			session.setAttribute("headUrl", user.getHeadUrl());
			System.err.println("用户头像"+user.getHeadUrl());
		}
		return map;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request, HttpSession session){
		session.invalidate(); //退出登录，删除session
		return "redirect:../";
	}
	
	@ResponseBody
	@RequestMapping(value="modifyUserInfo.do")
	public Map<String,String> modifyUserInfo(User user,HttpSession session){
		Map<String,String> map = new HashMap<String,String>();
		boolean result = userService.modifyUserInfoById(user);
		if(result) {
			map.put("msg", "ok");
			if(user.getHeadUrl()!=null){
				session.removeAttribute("user_head");
				session.setAttribute("user_head", user.getHeadUrl());
			}
		}else{
			map.put("msg", "error");
		}
		return map;

	}
	
	
}
