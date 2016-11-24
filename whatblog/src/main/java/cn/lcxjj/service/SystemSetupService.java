package cn.lcxjj.service;

import cn.lcxjj.pojo.SystemSetup;

public interface SystemSetupService {
	
	SystemSetup selectSystemSetup();
	
	
	/**
	 * 获取一条记录
	 * @param id
	 * @return
	 */
	SystemSetup selectByPrimaryKey(Integer id);

	/**
	 * 修改记录，id一定不能为空
	 * @param SystemSetup
	 * @return
	 */
	int updateByPrimaryKeySelective(SystemSetup systemSetup);
	
	/**
	 * 写文章积分
	 * @return
	 */
	int getWriteArticleMark();
	/**
	 * 写评论积分
	 * @return
	 */

	int getWriteCommentMark();
	/**
	 * 获得评论积分
	 * @return
	 */
	int getReceiveCommentMark();
	
	String getDaily();
}
