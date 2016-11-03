package cn.lcxjj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("aaa")
public class AAAA {
	@RequestMapping("a.do")
	public String aaa(){
		System.out.println("dljfslfgj lk");
		return "index";
	}
}
