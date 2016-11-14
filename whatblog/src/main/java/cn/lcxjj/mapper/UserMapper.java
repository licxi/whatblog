package cn.lcxjj.mapper;

import java.util.List;
import java.util.Map;

import cn.lcxjj.pojo.User;

public interface UserMapper {
	
	/**
	 * 会员总数
	 * @return
	 */
	int usersCount();
	
	/**
	 * 根据用户查找用户
	 * @param username
	 * @return
	 */
	User selectByUserName(String username);
	
	/**
	 * 根据id删除用户信息
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);
    
    /**
     * 修改密码
     * @param map
     * @return
     */
    int modifyPwd(Map<String, String> map);

    /**
     * 插入一条信息，所有字段都要有值
     * @param user
     * @return
     */
    int insert(User user);

    /**
     * 插入不为空的字段
     * @param record
     * @return
     */
    int insertSelective(User record);

    /**
     * 根据主键查找用户
     * @param id
     * @return
     */
    User selectByPrimaryKey(Integer id);

    /**
     * 升级有设置值的属性
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(User user);

    /**
     * 升级所有属性，需要将所有属性设置，不然会出问题
     * @param user
     * @return
     */
    int updateByPrimaryKey(User user);
    
    /**
     * 修改用户头像地址
     * @param headUrl
     * @param userName
     * @return
     */
    int modifyHead(Map<String,String> map);
    
    /**
     * 获取全部的会员
     * @return
     */
    List<User> selectAll();
    
    /**增加会员积分
     * 
     */
    int addMark(Map<String, Object> map);
    
    /**
     * 获取用户是否被禁
     * @param userName
     * @return
     */
    Short getIsLock(String userName);
    
    /**
     * 修改用户状态
     */
    
    int modifyIsLock(Map<String, Object> map);
    
    /**
     * 根据用户名/昵称/手机号/邮箱/qq查询用户
     * @param search
     * @return
     */
    List<User> searchUser(Map<String, Object> map);
}