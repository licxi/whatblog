package cn.lcxjj.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lcxjj.pojo.Comment;
import cn.lcxjj.service.CommentService;
import cn.lcxjj.util.JSONResult;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@ResponseBody
	@RequestMapping("saveComment")
	public Object saveComment(Comment comment,HttpSession session){
		
		String userName = (String) session.getAttribute("user_name");
		if(userName == null){
			return new JSONResult<>("-2", "请登录后再评论！");
		}
		if(comment != null){
			comment.setUserName(userName);
		}
		int result = commentService.saveComment(comment);
		System.out.println("获得的id"+result);
		Comment c = commentService.selectOne(comment.getId());
		Date date = c.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		c.setFormatTime(sdf.format(date));
		return result > 0 ?new JSONResult<Comment>("0", c,"评论成功"):new JSONResult<>("-1", "评论失败");
	}
}
