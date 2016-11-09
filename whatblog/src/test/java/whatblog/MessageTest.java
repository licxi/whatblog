package whatblog;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.lcxjj.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class MessageTest {
	
	@Autowired
	private MessageService messageService;
	
	@Test
	public void testGetMessage(){
		System.out.println(messageService.getMessages("licxi"));
	}
}
