package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.User;

public interface UserService {
	/**
	 * 会员总数
	 * @return
	 */
	int usersCount();
	
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
    
    /**
     * 获取全部的会员
     * @return
     */
    List<User> selectAll();
    
    /**增加会员积分
     * 
     */
    int addMark(String userName,Integer mark);
    
    /**
     * 获取用户是否被禁
     * @param userName
     * @return 0 未禁        1 为被禁
     */
    Short getIsLock(String userName);
    
    /**
     * 修改用户状态，当被禁时，修改为启用，当启用时，修改为被禁
     */
    
    int modifyIsLock(String userName);
    
    /**
	 * 根据id删除用户信息
	 * @param id
	 * @return
	 */
    int deleteByUserId(Integer id);
    
    /**
     * 根据用户名/昵称/手机号/邮箱/qq查询用户
     * @param search
     * @return
     */
    List<User> searchUser(String search,boolean isLock);
}
