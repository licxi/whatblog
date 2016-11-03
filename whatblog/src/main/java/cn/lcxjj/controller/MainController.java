package cn.lcxjj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 网站首页的相关操作
 * @author TrueLE
 *
 */
@Controller
@RequestMapping("main")
public class MainController {

	@RequestMapping("index")
	public String index(){
		return "main/main";
	}
	
}
