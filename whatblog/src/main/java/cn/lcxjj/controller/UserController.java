package cn.lcxjj.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lcxjj.pojo.User;
import cn.lcxjj.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("toLogin")
	public String toLogin(Model model){
		model.addAttribute("type", 1);
		return "user/login_register";
	}
	
	@RequestMapping("getUeditorContent")
	public String getUeditorContent(String content,Model model){
		model.addAttribute("content", content);
		return "user/showUeditorContent";
	}
	
	
	
	
	@RequestMapping("toReg")
	public String toReg(Model model){
		model.addAttribute("type", 0);
		return "user/login_register";
	}
	
	@ResponseBody
	@RequestMapping("checkUserName")
	public Map<String,String> checkUserName(String userName){
		Map<String,String> map = new HashMap<String,String>();
		int result = userService.checkUserName(userName.trim());
		if(result == 0){
			//用户存在，可以注册
			map.put("code","ok");
		} else {
			map.put("code", "error");
		}
		return map;
	}
	
	
	
	
	@RequestMapping(value="reg",method=RequestMethod.POST)
	public String reg(User user){
		//System.out.println(user);
		boolean result = false;
		if(userService.checkUserName(user.getUserName())==0){ //防止用户重复提交
			Date data = new Date();
			user.setCreateTime(data);
			System.out.println("是什么格式："+data.toString());
			//将密码加密保存
			user.setPassword(DigestUtils.md5Hex(DigestUtils.md5Hex(user.getPassword())+data.toString()));
			result = userService.register(user);
		}else{
			return "redirect:toLogin";
		}
		if(result){
			return "main/reg_success";
		}else{
			return "redirect:toReg";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="doLogin",method=RequestMethod.POST)
	public Map<String, String> doLogin(HttpServletRequest request,String username,String password){
		Map<String,String> map = new HashMap<String,String>();
		HttpSession session = request.getSession();
		username = username.trim();
		password = password.trim();
		int result = userService.login(username, password);
		if(result == -1){
			map.put("code", "error");
			map.put("msg", "账号错误");
		} else if(result == 0){
			map.put("code", "error");
			map.put("msg", "密码错误");
		} else if(result == 2){
			map.put("code", "error");
			map.put("msg", "你的账号已被管理员限制登录");
		} else if(result == 1){
			map.put("code", "ok");
			map.put("msg", "登录成功");
			map.put("callback", request.getContextPath()+"/");
			User user = userService.selectByUserName(username);
			session.setAttribute("user_name", username);
			session.setAttribute("nickname", user.getNickname());
			session.setAttribute("headUrl", user.getHeadUrl());
		}
		return map;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpSession session){
		session.invalidate(); //退出登录，删除session
		return "redirect:../";
	}
	
	@ResponseBody
	@RequestMapping(value="modifyUserInfo")
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
	
	/**
	 * 检查原密码是否一致
	 * @param password
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkPwd")
	public Map<String, String> checkPwd(@RequestParam("old_password") String password,HttpSession session){
		return check(password, session);
		
	}

	private Map<String, String> check(String password, HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		String userName = (String) session.getAttribute("user_name");
		if(userName == null){
			map.put("errCode", "-1");
			map.put("msg", "密码不匹配！");
			return map;
		}
		User user = userService.selectByUserName(userName);
		if(user == null){
			map.put("errCode", "-1");
			map.put("msg", "密码不匹配！");
			return map;
		} else if(user.getPassword().equals(password)){
			map.put("errCode", "0");
			return map;
		} else{
			map.put("errCode", "-1");
			map.put("msg", "密码不匹配！");
			return map;
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="modifyPwd")
	public Map<String, String> modifyPwd(@RequestParam("old_password") String old_password,@RequestParam("new_password") String new_password,HttpSession session){
		Map<String ,String> check = check(old_password, session);
		if(check.get("errCode").equals("0")){
			String userName = (String) session.getAttribute("user_name");
			int result = userService.modifyPwd(userName, new_password);
			if(result>0){
				check.put("errCode", "0");
				check.put("msg", "修改成功！");
			}else{
				check.put("errCode", "-1");
				check.put("msg", "修改失败！");
			}
		}else{
			check.put("errCode", "-1");
			check.put("msg", "修改失败！");
		}
		return check;
	}
}
