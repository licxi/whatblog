package cn.lcxjj.controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.Attention;
import cn.lcxjj.pojo.Message;
import cn.lcxjj.pojo.Suggest;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.pojo.User;
import cn.lcxjj.service.ArticleService;
import cn.lcxjj.service.AttentionService;
import cn.lcxjj.service.MessageService;
import cn.lcxjj.service.SuggestService;
import cn.lcxjj.service.TypeService;
import cn.lcxjj.service.UserService;

@Controller
@RequestMapping("/{userName}")
@Transactional
public class UserBlogHomeController {

	/**
	 * 关注管理服务
	 */
	@Autowired
	private AttentionService attentionService;

	/**
	 * 文章管理服务
	 */
	@Autowired
	private ArticleService articleService;

	/**
	 * 留言管理服务
	 */
	@Autowired
	private MessageService messageService;

	/**
	 * 文章分类管理服务
	 */
	@Autowired
	private TypeService typeService;

	/**
	 * 用户管理服务
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * 用户建议服务
	 */
	@Autowired
	private SuggestService suggestService;

	/**
	 * 
	 * @param userName
	 * @param map
	 * @return
	 */

	@RequestMapping("/")
	public String home(@PathVariable String userName, HttpSession session){
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		return "redirect:home";
	}
	
	@RequestMapping("/home")
	public String userBlogHome(@PathVariable String userName, ModelMap map, HttpSession session) {
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		int attentionCount = attentionService.countUser(userName);// 关注博主的人数
		int youAttentionCount = attentionService.countAttentionUser(userName);// 博主关注的人数
		int articleCount = articleService.userArticleCount(userName);
		int messageCount = messageService.userMessageCount(userName);
		List<Article> hostAritcel = articleService.selectHostArticleByUserName(userName);

		map.addAttribute("attentionCount", attentionCount);
		map.addAttribute("youAttentionCount", youAttentionCount);
		map.addAttribute("articleCount", articleCount);
		map.addAttribute("messageCount", messageCount);
		map.addAttribute("hostArticles", hostAritcel);
		return "user_blog/blog_home";
	}

	@RequestMapping("writeArticle")
	public String writeArticle(@PathVariable String userName, ModelMap map,HttpSession session) {
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		List<Type> types = typeService.selectAll();
		map.addAttribute("types", types);
		map.addAttribute("userName", userName);
		System.out.println(types.toString());
		return "user_blog/write_article";
	}
	
	@RequestMapping("modifyArticle/{id}")
	public String modifyArticle(@PathVariable String userName, ModelMap map,HttpSession session,@PathVariable int id) {
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		Article article = articleService.selectByPrimaryKey(id);
		List<Type> types = typeService.selectAll();
		map.addAttribute("id", id);
		map.addAttribute("types", types);
		map.addAttribute("userName", userName);
		map.addAttribute("article", article);
		return "user_blog/write_article";
	}

	@RequestMapping("saveArticle")
	public String saveArticle(Article article) {
		// 保存
		int result = articleService.saveArticle(article);
		if (result > 0) {
			return "redirect:articleManage";
		} else {
			return "writeArticle";
		}
	}

	@RequestMapping("showArticle/{id}")
	public String showArticle(@PathVariable String userName, @PathVariable int id, ModelMap map,HttpSession session) {
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		Article article = articleService.getArticleAndComment(id);
		if (article == null || !article.getUserName().equals(userName)) { // 防止用户在地址栏输入其他的文章id
			return "redirect:articleManage";
		}
		map.addAttribute("article", article);
		return "user_blog/show_article";
	}

	@RequestMapping("articleManage")
	public String articleManage(@PathVariable String userName, ModelMap map,HttpSession session) {
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		List<Article> articles = articleService.getUserAllArticle(userName);
		map.addAttribute("articles", articles);
		return "user_blog/article_manage";
	}

	@RequestMapping("userInfo")
	public String userInfo(@PathVariable String userName, ModelMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		User user = userService.selectByUserName(userName);
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null && flashMap.containsKey("msg")) {
			String msg = flashMap.get("msg").toString();
			map.addAttribute("msg", msg);
		}
		map.addAttribute("user", user);
		return "user_blog/user_info";
	}

	@RequestMapping("saveUserInfo")
	public String savaeUserInfo(User user, RedirectAttributes att) {
		if (userService.modifyUserInfoById(user)) {
			att.addFlashAttribute("msg", "修改成功");
		} else {
			att.addFlashAttribute("msg", "修改失败！");
		}
		return "redirect:userInfo";

	}

	@ResponseBody
	@RequestMapping("deleteArticle")
	public Map<String, String> deleteArticle(@PathVariable String userName, @RequestParam("article_id") int id, HttpSession session) {
		String loginUserName = (String) session.getAttribute("user_name");
		Map<String, String> map = new HashMap<String, String>();
		if (loginUserName == null) {
			map.put("errcode", "1");
			map.put("msg", "删除失败");
			return map;
		}
		if (!loginUserName.equals(userName)) {
			map.put("errcode", "1");
			map.put("msg", "删除失败");
			return map;
		}
		if (articleService.deleteByPrimaryKey(userName, id)) { // userName
																// 用户判断当前用户与文章的作者是否相同
			map.put("errcode", "0");
			map.put("msg", "删除成功");
		} else {
			map.put("errcode", "1");
			map.put("msg", "删除失败");
		}
		return map;

	}

	@ResponseBody
	@RequestMapping("setIsPublic")
	public Map<String, String> setIsPublic(Article article) {
		Map<String, String> map = new HashMap<String, String>();
		if (article == null) {
			map.put("errcode", "-1");
			map.put("msg", "设置失败！");
		}
		int result = articleService.modifyArticleType(article);
		if (result > 0) {
			map.put("errcode", "0");
			map.put("msg", "设置成功！");
		} else {
			map.put("errcode", "-1");
			map.put("msg", "设置失败！");
		}
		return map;
	}

	/**
	 * 用户修改头衔，将图片保存的地址存到数据库，并返回地址
	 * 
	 * @param userName
	 * @param file
	 * @param requset
	 * @return
	 */
	@ResponseBody
	@RequestMapping("modifyHead")
	public Map<String, String> fileUpload(@PathVariable String userName,
			@RequestParam(value = "imgUpl", required = false) MultipartFile file, HttpServletRequest requset) {
		Map<String, String> map = new HashMap<String, String>();
		HttpSession session = requset.getSession();
		String path = session.getServletContext().getRealPath("/") + "/upload/img";// 图片保存的路径
		String fileName = file.getOriginalFilename(); // 获取文件名
		String name = fileName.substring(0, fileName.indexOf("."));
		String fileType = fileName.substring(fileName.indexOf("."), fileName.length());
		String saveName = null;
		Date date = new Date();
		saveName = Base64.getEncoder().encodeToString((name + date.getTime()).getBytes());
		saveName = saveName.replace(".", "a");// 防止出现"."
		System.out.println(path);
		File uploadFile = new File(path, saveName + fileType);
		String ContextPath = requset.getContextPath();
		try {
			file.transferTo(uploadFile); // 将来要将路径保存到数据库中
			map.put("error", "0");
			map.put("url", ContextPath + "/upload/img/" + saveName + fileType); // 返回图片的地址，用于显示
			userService.modifyHead(ContextPath + "/upload/img/" + saveName + fileType, userName); // 修改数据库中的头像地址，
			session.removeAttribute("headUrl");
			session.setAttribute("headUrl", ContextPath + "/upload/img/" + saveName + fileType); // 更新session
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("commentManage")
	public String commentManage(@PathVariable String userName,HttpSession session){
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		return "user_blog/comment_manage";
	}
	
	@RequestMapping("messageManage")
	public String messageManage(@PathVariable String userName,ModelMap map){
		List<Message> messages = messageService.getMessages(userName);
		map.addAttribute("messages", messages);
		return "user_blog/message_manage";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteMessage",method=RequestMethod.POST)
	public Map<String, String> deleteMessage(@PathVariable String userName,@RequestParam("id") int messageId,HttpSession session) {
		String loginUserName = (String) session.getAttribute("user_name");
		Map<String, String> map = new HashMap<String, String>();
		if (loginUserName == null) {
			map.put("errcode", "-1");
			map.put("msg", "删除失败");
			return map;
		}
		if (!loginUserName.equals(userName)) {
			map.put("errcode", "-1");
			map.put("msg", "删除失败");
			return map;
		}
		int result = messageService.deleteByPrimaryKey(userName, messageId);
		if(result != 0){
			map.put("errCode", "0");
			map.put("msg", "删除成功！");
		} else{
			map.put("errCode", "-1");
			map.put("msg", "删除失败！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="replyMessage",method = RequestMethod.POST)
	public Map<String, String> replyMessage(
			@PathVariable String userName,
			@RequestParam("toUserName") String toUserName,
			@RequestParam("content") String content){
		Map<String, String> map = new HashMap<String,String>();
		Message message = new Message();
		message.setContent(content);
		message.setUserName(toUserName);
		message.setFromUserName(userName);
		int result = messageService.insertSelective(message);
		if(result != 0){
			map.put("errCode", "0");
			map.put("msg", "回复成功！");
		}else{
			map.put("errCode", "-1");
			map.put("msg", "回复失败");
		}
		return map;
		
	}
	
	
	@RequestMapping("attentionManage")
	public String attentionManage(@PathVariable String userName, HttpSession session,ModelMap map){
		String loginUserName = (String) session.getAttribute("user_name");
		if (loginUserName == null) {
			return "error";
		}
		if (!loginUserName.equals(userName)) {
			return "error";
		}
		List<Attention> attentionsYou = attentionService.selectByAttentionUserName(userName);
		List<Attention> yourAttentions = attentionService.selectByUserName(userName);
		map.addAttribute("attentionsYou", attentionsYou); //关注用户的
		map.addAttribute("yourAttentions", yourAttentions); //用户关注的
		return "user_blog/attention_manage";
	}
	
	@ResponseBody
	@RequestMapping("cancelAttention")
	public Map<String, String> cancelAttention(@PathVariable String userName, HttpSession session,@RequestParam("id") int id){
		String loginUserName = (String) session.getAttribute("user_name");
		Map<String, String> map = new HashMap<String, String>();
		if (loginUserName == null) {
			map.put("errcode", "-1");
			map.put("msg", "取消关注失败！");
			return map;
		}
		if (!loginUserName.equals(userName)) {
			map.put("errcode", "-1");
			map.put("msg", "取消关注失败！");
			return map;
		}
		//已取消关注!
		int result = attentionService.deleteByPrimaryKey(id);
		if(result != 0) {
			map.put("errCode", "0");
			map.put("msg", "已取消关注！");
		} else{
			map.put("errcode", "-1");
			map.put("msg", "取消关注失败！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="saveSuggest",method = RequestMethod.POST)
	public Map<String,String> saveSuggest(@PathVariable String userName, HttpSession session,@RequestParam("content") String content){
		String loginUserName = (String) session.getAttribute("user_name");
		Map<String, String> map = new HashMap<String, String>();
		if (loginUserName == null) {
			map.put("errcode", "-1");
			map.put("msg", "提交失败！");
			return map;
		}
		if (!loginUserName.equals(userName)) {
			map.put("errcode", "-1");
			map.put("msg", "提交失败！");
			return map;
		}
		Suggest suggest = new Suggest();
		suggest.setUserName(userName);
		suggest.setContent(content);
		int result = suggestService.savaSuggest(suggest);
		if(result != 0){
			map.put("errCode", "0");
			map.put("msg", "提交成功，谢谢您的建议！");
		} else{
			map.put("errcode", "-1");
			map.put("msg", "提交失败！");
		}
		return map;
	}
	
}
