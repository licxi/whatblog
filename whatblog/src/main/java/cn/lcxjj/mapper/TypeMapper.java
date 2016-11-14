package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.Type;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

	int insert(Type type);

	int insertSelective(Type type);

	Type selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Type type);

	int updateByPrimaryKey(Type type);

	/**
	 * 获取全部分类
	 * @return
	 */
	List<Type> selectAll();
	
}