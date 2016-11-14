package whatblog;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lcxjj.mapper.ArticleMapper;
import cn.lcxjj.pojo.Article;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.service.ArticleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class ArticleTest {
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Autowired
	private ArticleService articleService;
	
	@Test
	public void getArticle(){
		PageHelper.startPage(1,1).setOrderBy("create_time");
		List<Article> articles = articleMapper.getUserAllArticle("licxi");
		PageInfo<Article> page = new PageInfo<Article>(articles);
		System.out.println("当前第几页："+page.getPageNum());
		System.out.println("一页的数量："+page.getPageSize());
		System.out.println("当前页开始列："+page.getStartRow());
		System.out.println("当前页结束列："+page.getEndRow());
		System.out.println("记录总数："+page.getTotal());
		System.out.println("总页数"+page.getPages());
		System.out.println("第一页："+page.getFirstPage());
		System.out.println("最后一页："+page.getLastPage());
		System.out.println("前面是否有页面："+page.isHasPreviousPage());
		System.out.println("后面是否有页面"+page.isHasNextPage());
		System.out.println("是否是第一个页面"+page.isIsFirstPage());
		System.out.println("是否是最后页面"+page.isIsLastPage());
		System.out.println(page.getList().get(0));
	}
	
	
	@Test
	public void getArticleAndComment(){
		//System.out.println(articleService.getArticleAndComment(8));
		System.out.println(articleService.selectHostArticle(0,2));
	}
	
	@Test
	public void searchArticle(){
		System.out.println(articleService.searchArticle(false, false, false,"WhatBlog"));
	}
	
	@Test
	public void findAriclePropertyByArticleIdTest(){
		System.out.println(articleService.findAriclePropertyByArticleId(9).get("articleLock"));
	}
	
}
