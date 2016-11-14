package cn.lcxjj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("test")
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
	
	@RequestMapping("test")
	public String test(ModelMap map,@RequestParam(value="pageNum",required=false) Integer pageNum){
		//return "user/show_blog_for_reader";
		//return "user/user_info";
		//return "article/write_article";
		//return "article/show_article";
		//return "user_blog/blog_home";
		//return "user_blog/user_info";
		//return "user_blog/massage";
		///return "user_blog/follow";
		//return "admin/system_manage";
		//return "admin/modify_password";
		//return "admin/user_manage";
		//return "admin/article_manage";
		return "admin/index";
		/*pageNum = pageNum == null?1:pageNum;
		PageHelper.startPage(pageNum, 2);
		List<Type> types = typeService.selectAll();
		PageInfo<Type> page = new PageInfo<Type>(types);
		map.put("pages", page);*/
		//return "admin/type_manage";
	}
}
