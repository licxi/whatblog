package cn.lcxjj.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.UserMapper;
import cn.lcxjj.pojo.User;
import cn.lcxjj.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public int login(String userName, String password) {
		User user = userMapper.selectByUserName(userName);
		if (user == null) {
			return -1;
		}
		if (user.getPassword().equals(password)) {
			return 1;
		} else {
			return 0;
		}
	}


	@Override
	public int checkUserName(String userName) {
		User user = userMapper.selectByUserName(userName);
		if (user == null) {
			return 0;
		} else {
			return 1;
		}
	}

	@Override
	public boolean register(User user) {
		int result = userMapper.insertSelective(user);
		return result == 1 ? true : false;
	}

	@Override
	public boolean modifyUserInfoById(User user) {
		//int result = userMapper.updateByPrimaryKeySelective(user);
		int result = userMapper.updateByPrimaryKey(user);
		return result == 1 ? true : false;
	}

	@Override
	public User selectByUserName(String username) {
		return userMapper.selectByUserName(username);
	}


	@Override
	public int modifyHead(String headUrl, String userName) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("headUrl", headUrl);
		map.put("userName", userName);
		return userMapper.modifyHead(map);
	}
}
