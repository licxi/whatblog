package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Type;

public interface TypeService {
	/**
	 * 获取全部分类
	 * 
	 * @return
	 */
	List<Type> selectAll();

	int deleteByPrimaryKey(Integer id);

	int insert(Type type);

	int insertSelective(Type type);

	Type selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Type type);
}
