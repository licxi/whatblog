package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.Type;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

	int insert(Type record);

	int insertSelective(Type record);

	Type selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Type record);

	int updateByPrimaryKey(Type record);

	/**
	 * 获取全部分类
	 * @return
	 */
	List<Type> selectAll();
	
}