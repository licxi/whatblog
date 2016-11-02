package cn.lcxjj.mapper;

import java.util.Map;

import cn.lcxjj.pojo.User;

public interface UserMapper {
	
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
    
}