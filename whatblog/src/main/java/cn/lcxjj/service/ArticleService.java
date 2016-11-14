package cn.lcxjj.service;

import java.util.List;
import java.util.Map;

import cn.lcxjj.pojo.Article;

public interface ArticleService {
	
	
	/**
     * 获取一篇文章的内容
     * @param id
     * @return
     */
    Article selectByPrimaryKey(Integer id);
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
     * @return 1 
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
	 * 用户删除一篇文章,需要判断当前的用户是否和文章的作者是否相同，只有相同才能进行删除操作，防止误删,删除成功后还要删除该文章的评论
	 * @param id
	 * @return
	 */
    boolean deleteByPrimaryKey(String userName,Integer id);
    
    /**
     * 管理员删除文章
     * @param id
     * @return
     */
    boolean adminDeleteByArticleId(Integer id);
    
    /**
     * 修改文章是否公开，当公开时修改成非公开，当非公开时修改成公开
     * @param article
     * @return
     */
    int modifyArticleType(Article article);
    
    /**
     * 获取文章总数
     * @return
     */
    int articlesCount();
    
   /* int modifyArticle(Article article);*/
    /**
     * 获取系统热门文章
     * 当两个参数都为 null 时查询全部，也就是说按照文章点击数，和发布时间查找
     * @return
     */
    List<Article> selectHostArticle(Integer start,Integer size);
    
    /**
     * map的value值功能介绍
     * articleIsLock  文章是否被禁，false未锁，true被锁
     * articleUp  false 未置顶 ，true 置顶
     * hostArticle false 不查找热门文章，true 查找热门文章
     * 全部为false时查找全部
     * @param map
     * @return
     */
    List<Article> searchArticle(boolean articleIsLock,boolean articleUp,boolean hostArticle,String search);

    /**
     * map 属性描述
     * key=articleUp value=1 or 0,1为文章时置顶，0为文章未置顶
     * key=articleLock value=1 or 0,1为文章被禁，0为文章正常
     * @param articldId
     * @return
     */
    Map<String,Object> findAriclePropertyByArticleId(Integer articldId);
    
    
    /**
     * 修改文章置顶状态
     * @param articleId
     * @return
     */
    boolean modifyArticleUp(Integer articleId);
    
    /**
     * 修改文章被锁状态
     * @param articleId
     * @return
     */
    boolean modifyArticleLock(Integer articleId);


}
