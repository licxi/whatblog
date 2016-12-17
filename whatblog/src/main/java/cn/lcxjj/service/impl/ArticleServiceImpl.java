package cn.lcxjj.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.ArticleMapper;
import cn.lcxjj.mapper.CommentMapper;
import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.Comment;
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
		if(article.getArticleSummary().length()>100){
			article.setArticleSummary(article.getArticleSummary().substring(0,100));
		}
		if (article.getId() == null) {
			return articleMapper.insertSelective(article); // 新增文章
		} else {
			article.setCreateTime(new Date()); // 更新时间
			return articleMapper.updateByPrimaryKeySelective(article); // 修改文章
		}

	}

	@Override
	public List<Article> getUserAllArticle(String userName) {
		return articleMapper.getUserAllArticle(userName);
	}
	@Override
	public List<Article> getUserAllArticleNoWithLockedArticle(String userName) {
		return articleMapper.getUserAllArticleNoWithLockedArticle(userName);
	}

	
	@Override
	public Article getArticleAndComment(int article_id) {
		Article article = articleMapper.getArticleAndComment(article_id);
		if(article == null){
			return null;
		}
		List<Comment> comments = article.getComments();
		List<Comment> temps = new ArrayList<Comment>();
		if (comments != null && comments.size() != 0) {
			for (int i = 0; i < comments.size(); i++) {
				Comment c1 = comments.get(i);
				if (c1.getToUserName() == null || c1.getToUserName().equals("")) {
					List<Comment> subtemps = new ArrayList<Comment>();
					for (int j = 0; j < comments.size(); j++) {
						Comment c = comments.get(j);
						if (c.getToUserName() != null && c.getToCommentId() != null) {
							if (c.getToUserName().equals(c1.getUserName()) && c.getToCommentId().equals(c1.getId())) {
								if (c1.getComments() != null) {
									subtemps.addAll(c1.getComments());
								}
								subtemps.add(c);
							}
						}
					}
					if (subtemps.size() != 0) {
						c1.setComments(subtemps);
					}
					temps.add(c1);
				}
			}
		}
		article.setComments(temps);
		return article;
	}

	@Override
	public boolean deleteByPrimaryKey(String userName, Integer id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		int result = 0;
		if (userName.equals(article.getUserName())) {
			result = articleMapper.deleteByPrimaryKey(id);
			if (result != 0) {
				// 文章删除后，删除该文章的所有评论
				commentMapper.deleteArticleComments(article.getId());
			}
		}
		return result == 0 ? false : true;
	}

	@Override
	public int modifyArticleType(Article article) {
		if (article == null) {
			return 0;
		}
		Article temp = articleMapper.selectByPrimaryKey(article.getId());
		if (temp.getArticleType() == 0) {
			article.setArticleType(1);
		} else {
			article.setArticleType(0);
		}
		int result = articleMapper.updateByPrimaryKeySelective(article);
		return result;
	}

	@Override
	public Article selectByPrimaryKey(Integer id) {
		return articleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int articlesCount() {
		return articleMapper.articlesCount();
	}

	@Override
	public List<Article> selectHostArticle(Integer start, Integer size) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("size", size);
		return articleMapper.selectHostArticle(map);
	}

	@Override
	public List<Article> searchArticle(boolean articleIsLock, boolean articleUp, boolean hostArticle, String search,Byte typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleIsLock", articleIsLock);
		map.put("articleUp", articleUp);
		map.put("hostArticle", hostArticle);
		map.put("search", search);
		map.put("typeId", typeId);
		return articleMapper.searchArticle(map);
	}

	@Override
	public Map<String, Object> findAriclePropertyByArticleId(Integer articleId) {
		return articleMapper.findAriclePropertyByArticleId(articleId);
	}

	@Override
	public boolean modifyArticleUp(Integer articleId) {
		Map<String, Object> temp = findAriclePropertyByArticleId(articleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		map.put("articleUp", temp.get("articleUp").equals(1) ? 0 : 1);
		int result = articleMapper.modifyArticleUp(map);
		return result != 0 ? true : false;
	}

	@Override
	public boolean modifyArticleLock(Integer articleId) {
		Map<String, Object> temp = findAriclePropertyByArticleId(articleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		map.put("articleLock", temp.get("articleLock").equals(1) ? 0 : 1);
		int result = articleMapper.modifyArticleLock(map);
		return result != 0 ? true : false;
	}

	@Override
	public boolean adminDeleteByArticleId(Integer id) {
		int result = articleMapper.deleteByPrimaryKey(id);
		if (result != 0) {
			commentMapper.deleteArticleComments(id); // 删除评论
		}
		return result != 0 ? true : false;
	}

	@Override
	public List<Article> selectNewArticle() {
		return articleMapper.selectNewArticle();
	}

	@Override
	public int articleClick(int articleId) {
		return articleMapper.articleClick(articleId);
	}

	@Override
	public List<Article> SearchArticleNoWithLockedArticle(String search, Byte typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("typeId", typeId);
		return articleMapper.SearchArticleNoWithLockedArticle(map);
	}

	/*
	 * @Override public int modifyArticle(Article article) { return
	 * articleMapper.updateByPrimaryKeySelective(article); }
	 */
}
