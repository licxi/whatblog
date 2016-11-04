package whatblog;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.lcxjj.mapper.ArticleMapper;
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
		System.out.println(articleMapper.getUserAllArticle("licxi"));
	}
	
	
	@Test
	public void getArticleAndComment(){
		System.out.println(articleService.getArticleAndComment(8));
	}
	
}
