package cn.lcxjj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
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
		if(user.getIsLock() == 1){
			return 2;
		}
		String md5Password = DigestUtils.md5Hex(password+user.getCreateTime());
		System.out.println(user.getCreateTime());
		System.out.println(md5Password);
		System.out.println(user.getPassword());
		if (user.getPassword().equals(md5Password)) {
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
		// int result = userMapper.updateByPrimaryKeySelective(user);
		int result = userMapper.updateByPrimaryKey(user);
		return result == 1 ? true : false;
	}

	@Override
	public User selectByUserName(String username) {
		return userMapper.selectByUserName(username);
	}

	@Override
	public int modifyHead(String headUrl, String userName) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("保存的地址：" + headUrl);
		map.put("headUrl", headUrl);
		map.put("userName", userName);
		return userMapper.modifyHead(map);
	}

	@Override
	public int modifyPwd(String userName, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("password", password);
		map.put("userName", userName);
		return userMapper.modifyPwd(map);
	}

	@Override
	public int usersCount() {
		return userMapper.usersCount();
	}

	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	/**
	 * 增加会员积分
	 * 
	 */
	public int addMark(String userName, Integer mark) {
		if (userName == null || mark == null) {
			return -1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("mark", mark);
		return userMapper.addMark(map);
	}

	@Override
	public Short getIsLock(String userName) {
		return userMapper.getIsLock(userName);
	}

	@Override
	public int modifyIsLock(String userName) {
		int nowStatus = userMapper.getIsLock(userName);
		int modifyStatus = nowStatus == 0 ? 1 : 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("isLock", modifyStatus);
		return userMapper.modifyIsLock(map);
	}
	
	@Override
	public int deleteByUserId(Integer id) {
		return userMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public List<User> searchUser(String search,boolean isLock) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (isLock) {
			map.put("isLock", 1);
		}
		map.put("search", search);
		return userMapper.searchUser(map);
	}
}
