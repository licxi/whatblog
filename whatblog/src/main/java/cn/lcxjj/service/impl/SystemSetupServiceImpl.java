package cn.lcxjj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.SystemSetupMapper;
import cn.lcxjj.pojo.SystemSetup;
import cn.lcxjj.service.SystemSetupService;

@Service
public class SystemSetupServiceImpl implements SystemSetupService {

	@Autowired
	private SystemSetupMapper systemSetupMapper;
	
	@Override
	public SystemSetup selectByPrimaryKey(Integer id) {
		return systemSetupMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SystemSetup systemSetup) {
		if(systemSetup == null || systemSetup.getId() == null){
			return -1;
		}
		return systemSetupMapper.updateByPrimaryKeySelective(systemSetup);
	}

	@Override
	public int getWriteArticleMark() {
		return selectByPrimaryKey(1).getWriteArticleMark();
	}

	@Override
	public int getWriteCommentMark() {
		return selectByPrimaryKey(1).getWriteCommentMark();
	}

	@Override
	public int getReceiveCommentMark() {
		return selectByPrimaryKey(1).getReceiveCommentMark();
	}

	@Override
	public SystemSetup selectSystemSetup() {
		return selectByPrimaryKey(1);
	}

	
}
