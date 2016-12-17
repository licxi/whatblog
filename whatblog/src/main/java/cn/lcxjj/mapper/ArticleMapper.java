package cn.lcxjj.mapper;

import java.util.List;
import java.util.Map;

import cn.lcxjj.pojo.Article;

public interface ArticleMapper {
	
	/**
	 * 删除一篇文章
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);

    int insert(Article article);

    int insertSelective(Article article);

    /**
     * 获取一篇文章的内容
     * @param id
     * @return 
     */
    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article article);

    int updateByPrimaryKeyWithBLOBs(Article article);

    int updateByPrimaryKey(Article article);
    
    /**
     * 某博主的文章总数
     * @param userName
     * @return
     */
    int userArticleCount(String userName);
    /**
     * 系统文章总数
     * @return
     */
    int articlesCount();
    
    /**
     * 获取博主热门的文章
     * @param userName
     * @return
     */
    List<Article> selectHostArticleByUserName(String userName);
    
    /**
     * 用户获取自己的文章，并且统计文章的评论数
     * @param userName
     * @return
     */
    List<Article> getUserAllArticle(String userName);
    
    /**
     * 获取用户的文章，并且统计文章的评论数
     * @param userName
     * @return
     */
    List<Article> getUserAllArticleNoWithLockedArticle(String userName);
    
    /**
     * 获取一篇文章的内容，及评论
     * @param article_id
     * @return
     */
    Article getArticleAndComment(int article_id);
    
    /**
     * 获取系统热门文章,
     * map 参数 start 开始位置，size 获取的数量，但可以为空，为空时，查询全部
     * @return
     */
    List<Article> selectHostArticle(Map<String, Integer> map);
    
    
    /**
     * 获取最新文章
     * @return
     */
    List<Article> selectNewArticle();
    
    /**
     * map的value值功能介绍
     * articleIsLock  文章是否被禁，false未锁，true被锁
     * articleUp  false 未置顶 ，true 置顶
     * hostArticle false 不查找热门文章，true 查找热门文章
     * search String  为null不查找
     * typeId  short 文章所属分类ID
     * @param map
     * @return
     */
    List<Article> searchArticle(Map<String,Object> map);
    
    /**
     * map 属性描述
     * key=articleUp value=1 or 0,1为文章时置顶，0为文章未置顶
     * key=articleLock value=1 or 0,1为文章被禁，0为文章正常
     * @param articldId
     * @return
     */
    Map<String,Object> findAriclePropertyByArticleId(Integer articldId);
    int modifyArticleUp(Map<String, Object> map);
    int modifyArticleLock(Map<String, Object> map);
    
    /**
     * 增加阅读量
     * @param articleId 文章的ID
     * @return
     */
    int articleClick(int articleId);
    
    /**
     * 
     * @param map可选参数： search 查找添加，typeId 根据文章的分类查找
     * @return
     */
    List<Article> SearchArticleNoWithLockedArticle(Map<String,Object> map);
}