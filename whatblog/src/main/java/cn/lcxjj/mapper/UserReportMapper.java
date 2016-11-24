package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.UserReport;

public interface UserReportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserReport record);

    int insertSelective(UserReport record);

    UserReport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserReport record);

    int updateByPrimaryKey(UserReport record);
    
    List<UserReport> selectAll();
}