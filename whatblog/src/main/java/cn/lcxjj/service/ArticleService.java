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
}
