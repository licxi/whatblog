package cn.lcxjj.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.AdminMapper;
import cn.lcxjj.pojo.Admin;
import cn.lcxjj.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin selectByAdminAccount(String adminAccount) {
		return adminMapper.selectByAdminAccount(adminAccount);
	}

	@Override
	public int modifyPassword(String adminAccount, String adminPassword) {
		if(adminAccount.trim().equals("") || adminPassword.trim().equals("")){
			return -1;
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("adminAccount", adminAccount);
		map.put("adminPassword", adminPassword);
		return adminMapper.modifyPassword(map);
	}

}
