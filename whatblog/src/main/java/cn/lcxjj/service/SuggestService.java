package cn.lcxjj.service;

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

}
