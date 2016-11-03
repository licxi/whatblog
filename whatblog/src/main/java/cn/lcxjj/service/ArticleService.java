package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Article;

public interface ArticleService {
	/**
	 * 获取用户的文章数量
	 * @param userName
	 * @return
	 */
	int userArticleCount(String userName);
	/**
     * 获取博主热门的文章
     * @param userName
     * @return
     */
    List<Article> selectHostArticleByUserName(String userName);
    
    /**
     * 保存文章
     * @param article
     * @return
     */
    int saveArticle(Article article);
    
    
    /**
     * 获取用户的文章，并且统计文章的评论数
     * @param userName
     * @return
     */
    List<Article> getUserAllArticle(String userName);
    
    /**
     * 获取一篇文章的内容，及评论
     * @param article_id
     * @return
     */
    Article getArticleAndComment(int article_id);
    
    /**
	 * 删除一篇文章,需要判断当前的用户是否和文章的作者是否相同，只有相同才能进行删除操作，防止误删,删除成功后还要删除该文章的评论
	 * @param id
	 * @return
	 */
    boolean deleteByPrimaryKey(String userName,Integer id);
    
    /**
     * 将有值得属性更新
     * @param article
     * @return
     */
    int updateByPrimaryKeySelective(Article article);
}
