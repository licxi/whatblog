package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.ArticleMapper;
import cn.lcxjj.mapper.CommentMapper;
import cn.lcxjj.pojo.Article;
import cn.lcxjj.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public int userArticleCount(String userName) {
		return articleMapper.userArticleCount(userName);
	}

	@Override
	public List<Article> selectHostArticleByUserName(String userName) {
		return articleMapper.selectHostArticleByUserName(userName);
	}

	@Override
	public int saveArticle(Article article) {
		return articleMapper.insertSelective(article);
	}

	@Override
	public List<Article> getUserAllArticle(String userName) {
		return articleMapper.getUserAllArticle(userName);
	}

	@Override
	public Article getArticleAndComment(int article_id) {
		return articleMapper.getArticleAndComment(article_id);
	}

	@Override
	public boolean deleteByPrimaryKey(String userName,Integer id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		int result = 0;
		if(userName.equals(article.getUserName())){
			result =articleMapper.deleteByPrimaryKey(id);
			if(result != 0){
				//文章删除后，删除该文章的所有评论
				commentMapper.deleteArticleComments(article.getId());
			}
		}
		return result==0?false:true;
	}

	@Override
	public int updateByPrimaryKeySelective(Article article) {
		if(article == null){
			return 0;
		}
		Article temp = articleMapper.selectByPrimaryKey(article.getId());
		if(temp.getArticleType() == 0){
			article.setArticleType(1);
		}else {
			article.setArticleType(0);
		}
		int result = articleMapper.updateByPrimaryKeySelective(article);
		return result;
	}
}
