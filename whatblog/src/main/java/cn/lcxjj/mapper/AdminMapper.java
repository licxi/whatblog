package cn.lcxjj.mapper;

import java.util.Map;

import cn.lcxjj.pojo.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin admin);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin admin);

    int updateByPrimaryKey(Admin admin);
    
    /**
     * 根据账号查询
     */
    Admin selectByAdminAccount(String adminAccount);
    
    /**
     * 修改密码
     * @param map
     * @return
     */
    int modifyPassword(Map<String, String> map);
}