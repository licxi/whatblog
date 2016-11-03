package cn.lcxjj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.lcxjj.mapper.CommentMapper;
import cn.lcxjj.service.CommentService;

public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public int deleteArticleComments(int article_id) {
		return commentMapper.deleteArticleComments(article_id);
	}

}
