package cn.lcxjj.service;

public interface CommentService {
	/**
     * 删除文章的所有评论 
     * @param article_id 文章的id
     * @return
     */
    int deleteArticleComments(int article_id);
}
