package whatblog;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.lcxjj.mapper.ArticleMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class ArticleTest {
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Test
	public void getArticle(){
		System.out.println(articleMapper.getUserAllArticle("licxi"));
	}
	
	
	@Test
	public void getArticleAndComment(){
		System.out.println(articleMapper.getArticleAndComment(1));
	}
	
}
