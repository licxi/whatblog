package cn.lcxjj.service;

import java.util.Map;

import cn.lcxjj.pojo.User;

public interface UserService {
	/**
	 * 检查用户信息，判断是否能登录
	 * @return 返回检查结果：
	 * 	   -1    没有该用户（用户名错误），
	 * 		0   密码错误，
	 * 		1  账号和密码匹配，可以登录。
	 */
	int login(String userName,String password);
	/**
	 * 
	 * @param userName
	 * @return 返回用户是否存在：
	 * 			0  不存在，
	 * 			1 存在。
	 */
	int checkUserName(String userName);
	
	/**
	 * 用户注册，需要设置账号（用户名），昵称，密码
	 * @param user
	 * @return
	 */
	boolean register(User user);
	
	/**
     * 修改密码
     * @param map
     * @return
     */
    int modifyPwd(String userName, String password);
	
	boolean modifyUserInfoById(User user);
	
	/**
	 * 根据用户名查找信息
	 * @param username
	 * @return
	 */
	User selectByUserName(String username);
	
	/**
     * 修改用户头像地址
     * @param headUrl
     * @param userName
     * @return
     */
    int modifyHead(String headUrl,String userName);
}
