package cn.lcxjj.mapper;

import cn.lcxjj.pojo.SystemSetup;

public interface SystemSetupMapper {
    /*int deleteByPrimaryKey(Integer id);

    int insert(SystemSetup record);

    int insertSelective(SystemSetup record);*/

    SystemSetup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SystemSetup systemSetup);

    /*int updateByPrimaryKey(SystemSetup record);*/
}