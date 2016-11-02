package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.Article;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article article);

    int insertSelective(Article article);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article article);

    int updateByPrimaryKeyWithBLOBs(Article article);

    int updateByPrimaryKey(Article article);
    
    int userArticleCount(String userName);
    
    /**
     * 获取博主热门的文章
     * @param userName
     * @return
     */
    List<Article> selectHostArticleByUserName(String userName);
    
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
    List<Article> getArticleAndComment(int article_id);
}