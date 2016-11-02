package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Type;

public interface TypeService {
	/**
	 * 获取全部分类
	 * @return
	 */
	List<Type> selectAll();
}
