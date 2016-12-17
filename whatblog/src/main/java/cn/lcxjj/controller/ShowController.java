package cn.lcxjj.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.pojo.User;
import cn.lcxjj.service.ArticleService;
import cn.lcxjj.service.AttentionService;
import cn.lcxjj.service.SystemSetupService;
import cn.lcxjj.service.TypeService;
import cn.lcxjj.service.UserService;

@Controller
@RequestMapping("show")
public class ShowController {
	/**
	 * 分页大小
	 */
	public static final int PAGESIZE = 10;

	@Autowired
	private TypeService typeService;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private UserService userService;

	@Autowired
	private AttentionService attentionService;

	@Autowired
	private SystemSetupService systemSetupService;

	@RequestMapping("blog/{userName}")
	public String userBlog(@PathVariable("userName") String userName, ModelMap map,
			@RequestParam(value = "page", required = false) Integer page, HttpSession session) {
		int attentionId = 0;
		if (userName == null) {
			return "error";
		}
		if (userService.checkUserName(userName) == 0) {
			return "error";
		}
		// 用户信息
		User user = userService.selectByUserName(userName);
		if(user.getIsLock() == 1){
			return "error";
		}
		String loginUser = (String) session.getAttribute("user_name");
		if (loginUser != null) {
			attentionId = attentionService.isAttentioned(loginUser, userName);// 判断登录的用户，有没有关注这个博主
		}

		map.put("attentionCount", attentionService.countUser(userName));

		map.put("attentionId", attentionId);
		// 热门文章
		List<Article> hostArticles = articleService.selectHostArticle(0, 10);
		map.put("hostArticles", hostArticles);

		// 当前时间
		map.put("nowDate", new Date());

		// 每日一句
		map.put("daily", systemSetupService.getDaily());

		// 用户的所有文章
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);// 使用PageHelper分页
		List<Article> allArticles = articleService.getUserAllArticleNoWithLockedArticle(userName);
		PageInfo<Article> pages = new PageInfo<Article>(allArticles);
		map.put("pages", pages);

		
		
		Date createTime = user.getCreateTime();
		Date nowTime = new Date();
		/*
		 * long temp = nowTime.getTime()-createTime.getTime(); int year = (int)
		 * (temp/365/24/60/60); int month
		 */
		Calendar createTimeCalendar = Calendar.getInstance();
		createTimeCalendar.setTime(createTime);
		Calendar nowTimeCalendar = Calendar.getInstance();
		nowTimeCalendar.setTime(nowTime);

		int year = nowTimeCalendar.get(Calendar.YEAR) - createTimeCalendar.get(Calendar.YEAR);
		if (year <= 0) {
			int month = nowTimeCalendar.get(Calendar.MONTH) - createTimeCalendar.get(Calendar.MONTH);
			user.setBlogAge(month + "月");
		} else {
			user.setBlogAge(year + "年");
		}
		user.setArticleCount(articleService.userArticleCount(userName));
		map.put("user", user);

		// 用户热门文章
		List<Article> userHostArticles = articleService.selectHostArticleByUserName(userName);
		map.put("userHostArticles", userHostArticles);

		return "user/show_blog_for_reader";
	}

	/**
	 * 显示文章内容
	 * 
	 * @param aiticleID
	 *            文章ID
	 * @param map
	 * @param page
	 * @return
	 */
	@RequestMapping("article/{aiticleID}")
	public String article(@PathVariable("aiticleID") Integer articleId, ModelMap map) {

		if(articleId == null){
			return "redirect:/";
		}
		Article article = articleService.getArticleAndComment(articleId);
		if(article == null){
			return "redirect:/";
		}else {
			articleService.articleClick(articleId);
		}
		// 所有文章分类
		List<Type> types = typeService.selectAll();
		map.put("types", types);
		// 热门文章
		List<Article> hostArticles = articleService.selectHostArticle(0, 10);
		map.put("hostArticles", hostArticles);

		// 当前时间
		map.put("nowDate", new Date());

		// 每日一句
		map.put("daily", systemSetupService.getDaily());
		
		PageHelper.startPage(1, 12);
		List<Article> likeArticles =  articleService.SearchArticleNoWithLockedArticle(null,  article.getTypeId());
		PageInfo<Article> pages = new PageInfo<Article>(likeArticles);
		map.put("likeArticles", pages.getList());
		map.put("article", article);
		
		return "article/show_article";
	}
}
