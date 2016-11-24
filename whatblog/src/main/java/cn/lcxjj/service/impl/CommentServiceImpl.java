package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.CommentMapper;
import cn.lcxjj.pojo.Comment;
import cn.lcxjj.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public int deleteArticleComments(int article_id) {
		return commentMapper.deleteArticleComments(article_id);
	}

	@Override
	public int commentsCount() {
		return commentMapper.commentsCount();
	}

	@Override
	public int deleteCommentByCommentId(int CommentId) {
		return commentMapper.deleteCommentByCommentId(CommentId);
	}

	@Override
	public List<Comment> selectAll() {
		return commentMapper.selectAll();
	}

}
