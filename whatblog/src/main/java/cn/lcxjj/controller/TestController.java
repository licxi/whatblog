package cn.lcxjj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("{main}")
public class TestController {
	@RequestMapping("{id}/test")
	public void test(@PathVariable String main,@PathVariable String id){
		System.out.println(main+":"+id);
	}
	
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	/**
	 * lfjslhslflsfljflj lfjlfj 
	 */
}
