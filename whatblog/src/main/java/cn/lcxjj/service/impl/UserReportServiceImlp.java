package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.UserMapper;
import cn.lcxjj.mapper.UserReportMapper;
import cn.lcxjj.pojo.User;
import cn.lcxjj.pojo.UserReport;
import cn.lcxjj.service.UserReportService;

@Service
public class UserReportServiceImlp implements UserReportService {
	
	@Autowired
	private UserReportMapper userReportMapper;
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int saveUserReport(UserReport userReport) {
		if(userReport == null || userReport.getUserName()==null || userReport.getUserName().trim().isEmpty() ||
				userReport.getReportContent()==null || userReport.getReportContent().trim().isEmpty()
				||userReport.getReportedUserName()==null || userReport.getReportedUserName().isEmpty()){
			return -1;
		}
		User user = userMapper.selectByUserName(userReport.getUserName());
		User reportedUser = userMapper.selectByUserName(userReport.getReportedUserName());
		if(user == null || reportedUser == null) {
			return -1;
		}
		return userReportMapper.insertSelective(userReport);
	}

	@Override
	public List<UserReport> selectAll() {
		return userReportMapper.selectAll();
	}

}
