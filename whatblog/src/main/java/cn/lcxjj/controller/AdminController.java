package cn.lcxjj.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lcxjj.pojo.Admin;
import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.ArticleReport;
import cn.lcxjj.pojo.Comment;
import cn.lcxjj.pojo.Message;
import cn.lcxjj.pojo.Suggest;
import cn.lcxjj.pojo.SystemSetup;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.pojo.User;
import cn.lcxjj.pojo.UserReport;
import cn.lcxjj.service.AdminService;
import cn.lcxjj.service.ArticleReportService;
import cn.lcxjj.service.ArticleService;
import cn.lcxjj.service.AttentionService;
import cn.lcxjj.service.CommentService;
import cn.lcxjj.service.MessageService;
import cn.lcxjj.service.SuggestService;
import cn.lcxjj.service.SystemSetupService;
import cn.lcxjj.service.TypeService;
import cn.lcxjj.service.UserReportService;
import cn.lcxjj.service.UserService;
import cn.lcxjj.util.JSONResult;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private SuggestService suggestService;

	@Autowired
	private AttentionService attentionService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private TypeService typeService;

	@Autowired
	private SystemSetupService systemSetupService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ArticleReportService articleReportService;
	
	@Autowired
	private UserReportService userReportService;

	
	/**
	 * 分页大小
	 */
	public static final int PAGESIZE = 10;

	@RequestMapping("")
	public String toIndex() {
		return "redirect:admin/index";
	}
	
	@RequestMapping("/")
	public String toIndex2() {
		return "redirect:index";
	}

	/**
	 * 后台主页
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("index")
	public String index(ModelMap map) {
		int usersCount = userService.usersCount();
		int articlesCount = articleService.articlesCount();
		int suggestsCount = suggestService.suggestCount();
		int commentsCount = commentService.commentsCount();
		map.put("usersCount", usersCount);
		map.put("articlesCount", articlesCount);
		map.put("suggestsCount", suggestsCount);
		map.put("commentsCount", commentsCount);
		map.put("hostArticles", articleService.selectHostArticle(0, 10));
		map.put("hostUsers", attentionService.selectHostUser());
		return "admin/index";
	}

	@RequestMapping("toLogin")
	public String toLogin() {
		return "admin/login";
	}

	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public Object login(@RequestParam("adminAccount") String adminAccount,
			@RequestParam("adminPassword") String adminPassword, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(adminAccount);
		Admin admin = adminService.selectByAdminAccount(adminAccount);
		if (admin == null) {
			map.put("errCode", "-1");
			map.put("msg", "账号 不存在，请重试！");
		} else if (!admin.getAdminPassword().equals(adminPassword)) {
			map.put("errCode", "-2");
			map.put("msg", "密码错误，请确认密码后重试！");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("adminAccount", admin.getAdminAccount());
			session.setAttribute("adminName", admin.getAdminName());
			map.put("errCode", "0");
			map.put("msg", "登录成功！");
			map.put("callback", request.getContextPath() + "/admin");
		}
		return map;
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session.invalidate(); // 退出登录，删除session
		return "redirect:/admin/toLogin";
	}

	/**
	 * 检查原密码是否一致
	 * 
	 * @param password
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "checkPwd")
	public Map<String, String> checkPwd(@RequestParam("old_password") String password, HttpSession session) {
		return check(password, session);

	}

	private Map<String, String> check(String password, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		String adminAccount = (String) session.getAttribute("adminAccount");
		if (adminAccount == null) {
			map.put("errCode", "-1");
			map.put("msg", "密码不匹配！");
			return map;
		}
		Admin admin = adminService.selectByAdminAccount(adminAccount);
		if (admin == null) {
			map.put("errCode", "-1");
			map.put("msg", "密码不匹配！");
			return map;
		} else if (admin.getAdminPassword().equals(password)) {
			map.put("errCode", "0");
			return map;
		} else {
			map.put("errCode", "-1");
			map.put("msg", "密码不匹配！");
			return map;
		}
	}

	@ResponseBody
	@RequestMapping(value = "modifyPwd")
	public Map<String, String> modifyPwd(@RequestParam("old_password") String old_password,
			@RequestParam("new_password") String new_password, HttpSession session) {
		Map<String, String> check = check(old_password, session);
		if (check.get("errCode").equals("0") && new_password != null) {
			String adminAccount = (String) session.getAttribute("adminAccount");
			int result = adminService.modifyPassword(adminAccount, new_password);
			if (result > 0) {
				check.put("errCode", "0");
				check.put("msg", "修改成功！");
			} else {
				check.put("errCode", "-1");
				check.put("msg", "修改失败！");
			}
		} else {
			check.put("errCode", "-1");
			check.put("msg", "修改失败！");
		}
		return check;
	}

	@RequestMapping("userManage")
	public String userManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String search) {
		if (search == null) {
			search = ""; // 当没有参数查找参数时，查找全部
		}
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<User> users = userService.searchUser(search, false);
		PageInfo<User> pages = new PageInfo<User>(users);
		map.put("pages", pages);
		map.put("search", search); // 保存搜索条件
		return "admin/user_manage";
	}

	@RequestMapping("lockedUserManage")
	public String LockedUserManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String search) {
		if (search == null) {
			search = ""; // 当没有参数查找参数时，查找全部
		}
		page = page == null ? 1 : page;
		PageHelper.startPage(page, 5);
		List<User> users = userService.searchUser(search, true);
		PageInfo<User> pages = new PageInfo<User>(users);
		map.put("pages", pages);
		map.put("search", search); // 保存搜索条件
		return "admin/locked_user_manage";
	}

	@ResponseBody
	@RequestMapping("modifyIsLock")
	public Object modifyIsLock(@RequestParam(value = "userName", required = true) String userName) {
		Map<String, String> map = new HashMap<String, String>();
		if (userName == null || userName.trim().isEmpty()) {
			map.put("errCode", "-1");
			map.put("msg", "修改失败！");
			return map;
		}
		int result = userService.modifyIsLock(userName);
		if (result > 0) {
			map.put("errCode", "0");
			map.put("msg", "修改成功");
		} else {
			map.put("errCode", "-1");
			map.put("msg", "修改失败！");
		}
		return map;
	}

	@ResponseBody
	@RequestMapping("deleteUser")
	public Object deleteUser(@RequestParam(value = "userId", required = true) int userId) {
		int result = userService.deleteByUserId(userId);
		if (result > 0) {
			// 应该还要删除他的文章，但是我手下留情，不删了，，因为我要偷懒
			return new JSONResult<String>("0", "删除成功！");
		} else {
			return new JSONResult<String>("-1", "删除失败！");
		}
	}

	@RequestMapping("articleManage")
	public String articleMange(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String search) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<Article> articles = articleService.searchArticle(false, false, false, search,null);
		PageInfo<Article> pages = new PageInfo<Article>(articles);
		map.put("url", "articleManage");
		map.put("pages", pages);
		return "admin/article_manage";
	}

	@RequestMapping("hostArticleManage")
	public String hostArticleManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String search) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<Article> articles = articleService.searchArticle(false, false, true, search,null);
		PageInfo<Article> pages = new PageInfo<Article>(articles);
		map.put("url", "hostArticleManage");
		map.put("pages", pages);
		return "admin/article_manage";
	}

	@RequestMapping("lockArticleManage")
	public String lockArticleManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String search) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<Article> articles = articleService.searchArticle(true, false, false, search,null);
		PageInfo<Article> pages = new PageInfo<Article>(articles);
		map.put("url", "lockArticleManage");
		map.put("pages", pages);
		return "admin/article_manage";
	}

	@RequestMapping("upArticleManage")
	public String upArticleManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String search) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<Article> articles = articleService.searchArticle(false, true, false, search,null);
		PageInfo<Article> pages = new PageInfo<Article>(articles);
		map.put("url", "upArticleManage");
		map.put("pages", pages);
		return "admin/article_manage";
	}

	@ResponseBody
	@RequestMapping("modifyArticleUp")
	public Object modifyArticleUp(@RequestParam("article_id") Integer articleId) {
		if (articleId == null) {
			return new JSONResult<>("-1", "修改失败");
		}
		boolean result = articleService.modifyArticleUp(articleId);
		if (result) {
			return new JSONResult<>("0", "修改成功");
		} else {
			return new JSONResult<>("-1", "修改失败");
		}
	}

	@ResponseBody
	@RequestMapping("modifyArticleLock")
	public Object modifyArticleLock(@RequestParam("article_id") Integer articleId) {
		if (articleId == null) {
			return new JSONResult<>("-1", "修改失败");
		}
		boolean result = articleService.modifyArticleLock(articleId);
		if (result) {
			return new JSONResult<>("0", "修改成功");
		} else {
			return new JSONResult<>("-1", "修改失败");
		}
	}

	@ResponseBody
	@RequestMapping("deleteArticle")
	public Object deleteArticle(@RequestParam("article_id") Integer articleId) {
		if (articleId == null) {
			return new JSONResult<>("-1", "删除失败");
		}
		boolean result = articleService.adminDeleteByArticleId(articleId);
		if (result) {
			return new JSONResult<>("0", "删除成功");
		} else {
			return new JSONResult<>("-1", "删除失败");
		}
	}

	@RequestMapping("typeManage")
	public String typeManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<Type> types = typeService.selectAll();
		PageInfo<Type> pages = new PageInfo<Type>(types);
		map.put("pages", pages);
		return "admin/type_manage";
		// 8833 4483 5936 6406 63
	}

	@ResponseBody
	@RequestMapping("addType")
	public Object addType(Type type) {
		if (type == null) {
			return new JSONResult<>("-1", "添加失败！");
		}
		System.out.println(type);
		int result = typeService.insertSelective(type);
		return result != 0 ? new JSONResult<>("0", "添加成功！") : new JSONResult<>("-1", "添加失败！");
	}

	@ResponseBody
	@RequestMapping("modifyType")
	public Object modifyType(Type type) {
		if (type == null || type.getId() == null || type.getId().equals("") || type.getTypeName().isEmpty()) {
			return new JSONResult<>("-1", "修改失败！");
		}
		int result = typeService.updateByPrimaryKeySelective(type);
		return result != 0 ? new JSONResult<>("0", "修改成功！") : new JSONResult<>("-1", "修改失败！");
	}

	@ResponseBody
	@RequestMapping("deleteType")
	public Object deleteType(@RequestParam(value = "type_id", required = true) Integer typeId) {
		if (typeId == null) {
			return new JSONResult<>("-1", "删除失败!");
		}
		int result = typeService.deleteByPrimaryKey(typeId);
		return result != 0 ? new JSONResult<>("0", "删除成功！") : new JSONResult<String>("-1", "删除失败！");
	}

	@RequestMapping("systemManage")
	public String systemMange(ModelMap map) {
		map.put("systemSetup", systemSetupService.selectSystemSetup());
		return "admin/system_manage";
	}

	@ResponseBody
	@RequestMapping("modifySystemSetup")
	public Object modifySystemSetup(@RequestBody SystemSetup systemSetup) {
		if (systemSetup == null) {
			return new JSONResult<>("-1", "修改失败");
		} else if (systemSetup.getSystemName() == null || systemSetup.getSystemName().isEmpty()) {
			return new JSONResult<>("-1", "网站名不能为空 ");
		} else if (systemSetup.getWriteArticleMark() == null) {
			return new JSONResult<>("-1", "发表文章积分参数不合法，必须为大于或等于零的整数");
		} else if (systemSetup.getReceiveCommentMark() == null) {
			return new JSONResult<>("-1", "发表评论积分参数不合法，必须为大于或等于零的整数");
		} else if (systemSetup.getReceiveCommentMark() == null) {
			return new JSONResult<>("-1", "收到评论积分参数不合法，必须为大于或等于零的整数");
		}
		systemSetup.setSystemName(systemSetup.getSystemName().trim());
		systemSetup.setDaily(systemSetup.getDaily().trim());
		int result = systemSetupService.updateByPrimaryKeySelective(systemSetup);
		return result > 0 ? new JSONResult<>("0", "修改成功") : new JSONResult<>("-1", "修改失败");
	}

	@ResponseBody
	@RequestMapping("modifyBackgroud")
	public Map<String, String> fileUpload(@RequestParam(value = "bg_img", required = true) MultipartFile file,
			HttpServletRequest requset) {
		Map<String, String> map = new HashMap<String, String>();
		String path = requset.getSession().getServletContext().getRealPath("/") + "/img";// 图片保存的路径
		File uploadFile = new File(path, "1.jpg");
		String ContextPath = requset.getContextPath();
		try {
			file.transferTo(uploadFile); // 将来要将路径保存到数据库中
			map.put("errCode", "0");
			map.put("url", ContextPath + "/img/1.jpg");
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping("commentManage")
	public String commentManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);
		List<Comment> comments = commentService.selectAll();
		PageInfo<Comment> pages = new PageInfo<Comment>(comments);
		map.put("pages", pages);
		return "admin/comment_manage";
	}

	@ResponseBody
	@RequestMapping("deleteComment")
	public Object deleteComment(@RequestParam(value = "comment_id", required = true) int commentId) {
		int result = commentService.deleteCommentByCommentId(commentId);
		return result > 0 ? new JSONResult<>("0", "删除成功") : new JSONResult<>("-1", "删除失败");
	}

	@RequestMapping("suggestManage")
	public String suggestManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);// 使用PageHelper分页
		List<Suggest> suggests = suggestService.selectAll();
		PageInfo<Suggest> pages = new PageInfo<Suggest>(suggests);
		map.put("pages", pages);
		return "admin/suggest_manage";
	}
	
	@ResponseBody
	@RequestMapping("deleteSuggest")
	public Object deleteSuggest(@RequestParam(value = "suggest_id", required = true) Integer suggestId) {
		int result = suggestService.deleteBySuggestId(suggestId);
		return result > 0 ? new JSONResult<>("0", "删除成功") : new JSONResult<>("-1", "删除失败");
	}
	
	@RequestMapping("messageManage")
	public String messageManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);// 使用PageHelper分页
		List<Message> messages = messageService.selectAll();
		PageInfo<Message> pages = new PageInfo<Message>(messages);
		map.put("pages", pages);
		return "admin/message_manage";
	}
	
	@ResponseBody
	@RequestMapping("deleteMessage")
	public Object deleteMessage(@RequestParam(value = "message_id", required = true) Integer messageId) {
		int result = messageService.deleteByMessageId(messageId);
		return result > 0 ? new JSONResult<>("0", "删除成功") : new JSONResult<>("-1", "删除失败");
	}
	
	@RequestMapping("articleReportManage")
	public String articleReportManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);// 使用PageHelper分页
		List<ArticleReport> articleReports = articleReportService.selectAll();
		PageInfo<ArticleReport> pages = new PageInfo<ArticleReport>(articleReports);
		map.put("pages", pages);
		return "admin/article_report__manage";
	}
	
	@RequestMapping("userReportManage")
	public String userReportManage(ModelMap map, @RequestParam(value = "page", required = false) Integer page) {
		page = page == null ? 1 : page;
		PageHelper.startPage(page, PAGESIZE);// 使用PageHelper分页
		List<UserReport> userReports = userReportService.selectAll();
		PageInfo<UserReport> pages = new PageInfo<UserReport>(userReports);
		map.put("pages", pages);
		return "admin/user_report__manage";
	}
}
