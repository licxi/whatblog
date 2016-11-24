package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.UserReport;

public interface UserReportService {
	int saveUserReport(UserReport record);
	List<UserReport> selectAll();
}
