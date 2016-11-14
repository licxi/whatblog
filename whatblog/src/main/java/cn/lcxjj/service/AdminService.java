package cn.lcxjj.service;

import cn.lcxjj.pojo.Admin;

public interface AdminService {
	/**
     * 根据账号查询
     */
    Admin selectByAdminAccount(String adminAccount);
    
    /**
     * 修改密码
     * @param map
     * @return
     */
    int modifyPassword(String adminAccount, String adminPassword);
}
