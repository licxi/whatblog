package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.ArticleMapper;
import cn.lcxjj.pojo.Article;
import cn.lcxjj.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleMapper articleMapper;

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

}
