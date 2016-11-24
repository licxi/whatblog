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

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
    
    /**
     * 删除文章的所有评论 
     * @param article_id 文章的id
     * @return
     */
    int deleteArticleComments(int article_id);
    
    int deleteCommentByCommentId(int CommentId);
    
    List<Comment> selectAll();
}