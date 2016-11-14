package cn.lcxjj.mapper;

import cn.lcxjj.pojo.Suggest;

public interface SuggestMapper {
	/**
	 * 用户提交的建议数
	 * @return
	 */
	int suggestCount();
	
    int deleteByPrimaryKey(Integer id);

    int insert(Suggest suggest);

    int insertSelective(Suggest suggest);

    Suggest selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Suggest suggest);

    int updateByPrimaryKey(Suggest suggest);
}