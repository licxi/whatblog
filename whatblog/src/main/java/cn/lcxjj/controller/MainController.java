package cn.lcxjj.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.ArticleReport;
import cn.lcxjj.pojo.Attention;
import cn.lcxjj.pojo.HostUser;
import cn.lcxjj.pojo.Message;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.pojo.UserReport;
import cn.lcxjj.service.ArticleReportService;
import cn.lcxjj.service.ArticleService;
import cn.lcxjj.service.AttentionService;
import cn.lcxjj.service.MessageService;
import cn.lcxjj.service.SystemSetupService;
import cn.lcxjj.service.TypeService;
import cn.lcxjj.service.UserReportService;
import cn.lcxjj.service.UserService;
import cn.lcxjj.util.JSONResult;

/**
 * 网站首页的相关操作
 * 
 * @author TrueLE
 *
 */
@Controller
@RequestMapping("main")
public class MainController {
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
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ArticleReportService articleReportService;
	
	@Autowired
	private UserReportService userReportService;

	@RequestMapping("index")
	public String index(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		// 热门博主
		List<HostUser> hostUsers = attentionService.selectHostUser();
		map.put("hostUsers", hostUsers);
		// 所有文章分类
		List<Type> types = typeService.selectAll();
		map.put("types", types);

		// 最新文章
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);// 使用PageHelper分页
		List<Article> newArticles = articleService.selectNewArticle();
		PageInfo<Article> pages = new PageInfo<Article>(newArticles);
		map.put("pages", pages);

		// 热门文章
		List<Article> hostArticles = articleService.selectHostArticle(0, 10);
		map.put("hostArticles", hostArticles);

		// 当前时间
		map.put("nowDate", new Date());

		// 每日一句
		map.put("daily", systemSetupService.getDaily());

		map.put("url", "index");

		return "main/main";
	}

	@ResponseBody
	@RequestMapping("replyMessage")
	public Object replyMessage(
			@RequestParam("toUser") String toUserName,
			@RequestParam("content") String content,
			HttpSession session){
		if(toUserName == null){
			return new JSONResult<>("-2", "留言失败");
		}
		if(content == null || content.trim().isEmpty()){
			return new JSONResult<>("-2", "留言内容不能为空！");
		}
		String formUserName = (String) session.getAttribute("user_name");
		if(formUserName == null) {
			return new JSONResult<>("-1", "你还没有登录，请登录后留言");
		}
		Message replyMessage = new Message();
		replyMessage.setFromUserName(formUserName);
		replyMessage.setUserName(toUserName);
		replyMessage.setContent(content);
		int result = messageService.insertSelective(replyMessage);
		return result > 0?new JSONResult<>("0", "留言成功！"):new JSONResult<>("-2", "留言失败！");
	}
	
	@ResponseBody
	@RequestMapping("attentionUser")
	public Object attentionUser(@RequestParam("attentionUserName") String attentionUserName,HttpSession session){
		if(attentionUserName == null){
			return new JSONResult<>("-1", "关注失败");
		}
		if(userService.checkUserName(attentionUserName) == 0){
			return new JSONResult<>("-1", "你要关注的用户不存在！");
			
		}
		String userName = (String) session.getAttribute("user_name");
		if(userName == null){
			return new JSONResult<>("-1", "你还没有登录，请登录后留言");
		}
		Attention attention = new Attention();
		attention.setUserName(userName);
		attention.setAttentionUserName(attentionUserName);
		int result = attentionService.saveAttention(attention );
		//返回插入的主键
		return result > 0?new JSONResult<Integer>("0", attention.getId(),"关注成功！"):new JSONResult<>("-1", "关注失败！");
	}
	
	@ResponseBody
	@RequestMapping("notAttentionUser")
	public Object noAttentionUser(@RequestParam("attentionId") Integer attentionId){
		int result = attentionService.deleteByPrimaryKey(attentionId);
		return result > 0 ?new JSONResult<>("0", "已取消关注"):new JSONResult<>("-1", "取消关注失败");
	}
	
	@ResponseBody
	@RequestMapping("reportArticle")
	public Object reportArticle(@RequestBody ArticleReport articleReport){
		if(articleReport == null){
			return new JSONResult<>("-1", "举报失败！");
		}
		int result = articleReportService.saveArticleReport(articleReport);
		return result > 0 ? new JSONResult<>("0", "举报成功！"):new JSONResult<>("-1", "举报失败！");
	}
	
	@ResponseBody
	@RequestMapping("reportUser")
	public Object reportUser(@RequestBody UserReport userReport){
		if(userReport == null){
			return new JSONResult<>("-1", "举报失败！");
		}
		System.out.println(userReport);
		int result = userReportService.saveUserReport(userReport);
		return result > 0 ? new JSONResult<>("0", "举报成功！"):new JSONResult<>("-1", "举报失败！");
	}
	
	

}
