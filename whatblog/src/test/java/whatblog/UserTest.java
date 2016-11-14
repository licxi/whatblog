package whatblog;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.lcxjj.mapper.UserMapper;
import cn.lcxjj.pojo.User;
import cn.lcxjj.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class UserTest {
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserService userService;
	
	@Test
	public void insert(){
		User user = new User();
		user.setUserName("licxi");
		user.setNickname("刘岑溪");
		user.setPassword("417708459");
		user.setDescription("这是我个人的博客");
		user.setPhone("18098108580");
		user.setGender("男");
		userMapper.insertSelective(user);
	}
	
	@Test
	public void search(){
		Map<String, Object> map = new HashMap<String, Object>();
		String search = "417708459@qq.com";
		map.put("isLock", 1);
		map.put("search", search);
		System.out.println(userMapper.searchUser(map));
	}
	
	@Test
	public void loginTest(){
		System.out.println(": 的值"+(int)':');
		System.out.println("登录测试："+userService.login("licxi", "30c8586794579fc0ea93c5b8561460b2"));
	}
	
	
	@Test
	public void select(){
		System.out.println(userMapper.selectByPrimaryKey(1));
	}
	
}
