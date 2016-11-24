package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Suggest;

public interface SuggestService {
	
	/**
	 * 保存一条用户建议
	 * @param suggest
	 * @return
	 */
	int savaSuggest(Suggest suggest);
	
	/**
	 * 用户提交的建议数
	 * @return
	 */
	int suggestCount();
	
	/**
	 * 查找所有的建议，然后使用PageHelper来分页
	 * @return
	 */
	List<Suggest> selectAll();
	
	int deleteBySuggestId(int suggestId);

}
