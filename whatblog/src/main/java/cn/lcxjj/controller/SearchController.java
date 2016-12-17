package cn.lcxjj.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.pojo.User;
import cn.lcxjj.service.ArticleService;
import cn.lcxjj.service.SystemSetupService;
import cn.lcxjj.service.TypeService;
import cn.lcxjj.service.UserService;

@Controller
@RequestMapping("search")
public class SearchController {
	private static final int PAGESIZE = 20;
	
	@Autowired
	private UserService userService;

	@Autowired
	private TypeService typeService;

	@Autowired
	private SystemSetupService systemSetupService;

	@Autowired
	private ArticleService articleService;

	@RequestMapping("article")
	public String article(@RequestParam(value = "wd", required = false) String wd,
			@RequestParam(value = "t", required = false) Byte typeId,
			@RequestParam(value = "page", required = false) Integer page, ModelMap map) {
		
		/*System.err.println(wd);
		System.err.println(typeId);*/
		page = page == null ?1:page;
		PageHelper.startPage(page, PAGESIZE);
		List<Article> articles = articleService.SearchArticleNoWithLockedArticle(wd, typeId);
		PageInfo<Article> pages = new PageInfo<Article>(articles);
		map.put("pages", pages);
		
		map.put("wd",wd);
		
		map.put("url", "/whatblog/search?wd="+wd+"&t="+typeId);
		
		// 所有文章分类
		List<Type> types = typeService.selectAll();
		map.put("types", types);

		// 当前时间
		map.put("nowDate", new Date());

		// 每日一句
		map.put("daily", systemSetupService.getDaily());

		// 热门文章
		List<Article> hostArticles = articleService.selectHostArticle(0, 10);
		map.put("hostArticles", hostArticles);

		return "article/article_search";
	}

	@RequestMapping("user")
	public String user(@RequestParam(value = "wd", required = false) String wd,
			@RequestParam(value = "page", required = false) Integer page, ModelMap map) {
		
		page = page == null ?1:page;
		PageHelper.startPage(page, PAGESIZE);
		List<User> users = userService.searchUser(wd, false);
		PageInfo<User> pages = new PageInfo<User>(users);
		map.put("pages", pages);
		
		map.put("wd",wd);
		
		map.put("url", "/whatblog/user?wd="+wd);
		
		// 所有文章分类
		List<Type> types = typeService.selectAll();
		map.put("types", types);

		// 当前时间
		map.put("nowDate", new Date());

		// 每日一句
		map.put("daily", systemSetupService.getDaily());

		// 热门文章
		List<Article> hostArticles = articleService.selectHostArticle(0, 10);
		map.put("hostArticles", hostArticles);
		return "user/user_search";
	}
}
