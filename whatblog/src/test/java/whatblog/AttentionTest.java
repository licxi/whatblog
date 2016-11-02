package whatblog;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.lcxjj.pojo.Attention;
import cn.lcxjj.service.AttentionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class AttentionTest {
	
	@Autowired
	private AttentionService attentionService;
	
	
	@Test
	public void getAttention(){
		List<Attention> list = attentionService.selectByUserName("licxi");
		System.out.println(list);
	}
	
	@Test
	public void getAttention1(){
		List<Attention> list = attentionService.selectByAttentionUserName("417708459");
		System.out.println(list);
	}
	
	@Test
	public void no(){
		System.out.println("他关注的："+attentionService.countAttentionUser("417708459"));
		System.out.println("关注自己的："+attentionService.countUser("417708459"));
	}
	
}
