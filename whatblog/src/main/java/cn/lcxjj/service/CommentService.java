package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Comment;

public interface CommentService {
	/**
     * 删除文章的所有评论 
     * @param article_id 文章的id
     * @return
     */
    int deleteArticleComments(int articleId);
    
    /**
	 * 评论总数
	 * @return
	 */
	int commentsCount();
	
	/**
	 * 根据评论id删除一条评论
	 * @param CommentId 评论id
	 * @return
	 */
	int deleteCommentByCommentId(int commentId);
	
	/**
	 * 查询所有的评论，使用PageHelper分页
	 * @return
	 */
	List<Comment> selectAll();
}
