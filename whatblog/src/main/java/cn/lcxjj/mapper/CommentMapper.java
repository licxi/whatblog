package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.Comment;

public interface CommentMapper {
	/**
	 * 评论总数
	 * @return
	 */
	int commentsCount();
    int deleteByPrimaryKey(Integer id);

    int insert(Comment comment);

    int insertSelective(Comment comment);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment comment);

    int updateByPrimaryKey(Comment comment);
    
    /**
     * 删除文章的所有评论 
     * @param article_id 文章的id
     * @return
     */
    int deleteArticleComments(int article_id);
    
    int deleteCommentByCommentId(int CommentId);
    
    List<Comment> selectAll();
}