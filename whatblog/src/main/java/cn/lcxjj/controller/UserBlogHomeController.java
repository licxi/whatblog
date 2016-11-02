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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.pojo.User;
import cn.lcxjj.service.ArticleService;
import cn.lcxjj.service.AttentionService;
import cn.lcxjj.service.MessageService;
import cn.lcxjj.service.TypeService;
import cn.lcxjj.service.UserService;

@Controller
@RequestMapping("/{userName}")
public class UserBlogHomeController {
	
	@Autowired
	private AttentionService attentionService;
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private TypeService typeService;
	
	
	@Autowired
	private UserService userService;
	/**
	 * 
	 * @param userName
	 * @param map
	 * @return
	 */
	
	@RequestMapping("/home.do")
	public String userBlogHome(@PathVariable String userName,ModelMap map){
		int attentionCount = attentionService.countUser(userName);//关注博主的人数
		int youAttentionCount = attentionService.countAttentionUser(userName);//博主关注的人数
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
	
	@RequestMapping("writeArticle.do")
	public String writeArticle(@PathVariable String userName,ModelMap map){
		List<Type> types = typeService.selectAll();
		map.addAttribute("types", types);
		map.addAttribute("userName", userName);
		System.out.println(types.toString());
		return "user_blog/write_article";
	}
	
	@RequestMapping("saveArticle.do")
	public String saveArticle(Article article,ModelMap map){
		System.err.println(article);
		map.addAttribute("content", article.toString());
		//保存
		int result = articleService.saveArticle(article);
		if(result >0){
			return "";
		} else {
			return "writeArticle.do";
		}
	}
	@RequestMapping("articleManage.do")
	public String articleManage(@PathVariable String userName,ModelMap map){
		
		return "user_blog/article_manage";
	}
	
	@RequestMapping("userInfo.do")
	public String userInfo(@PathVariable String userName,ModelMap map,HttpServletRequest request){
		User user = userService.selectByUserName(userName);
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!= null && flashMap.containsKey("msg")){
		String msg= flashMap.get("msg").toString();
			map.addAttribute("msg", msg);
		}
		map.addAttribute("user", user);
		return "user_blog/user_info";
	}
	
	@RequestMapping("saveUserInfo.do")
	public String savaeUserInfo(User user,RedirectAttributes att){
		if(userService.modifyUserInfoById(user)){
			att.addFlashAttribute("msg", "修改成功");
		}else{
			att.addFlashAttribute("msg", "修改失败！");
		}
		return "redirect:userInfo.do";

	}
	
	@ResponseBody
	@RequestMapping("modifyHead.do")
	public Map<String,String> fileUpload(@PathVariable String userName,@RequestParam(value="imgUpl",required=false) 
		MultipartFile file,HttpServletRequest requset){
		Map<String,String> map = new HashMap<String,String>();
		HttpSession session = requset.getSession();
		String path = session.getServletContext().getRealPath("/")+"/upload/img";//图片保存的路径
		//String path = requset.getSession().getServletContext().getRealPath("/")+"\\uploads";
		String fileName = file.getOriginalFilename(); //获取文件名
		String name = fileName.substring(0, fileName.indexOf("."));
		String fileType = fileName.substring(fileName.indexOf("."),fileName.length());
		String saveName = null;
		Date date = new Date();
		saveName = Base64.getEncoder().encodeToString((name+date.getTime()).getBytes());
		saveName = saveName.replace(".", "a");//防止出现"."
		String type = file.getContentType();
		System.out.println(path);
		File uploadFile = new File(path,saveName+fileType);
//		System.out.println("地址:"+path);
		/*if(!uploadFile.exists()){
			uploadFile.mkdirs();
		}*/
		try {
			file.transferTo(uploadFile); //将来要将路径保存到数据库中
			map.put("error", "0");
			map.put("url", "/whatblog/upload/img/"+saveName+fileType);
			userService.modifyHead("/whatblog/upload/img/"+saveName+fileType, userName);
			session.removeAttribute("headUrl");
			session.setAttribute("headUrl", "/whatblog/upload/img/"+saveName+fileType);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
		
	}
}
