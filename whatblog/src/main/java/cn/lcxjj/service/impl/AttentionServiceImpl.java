package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.AttentionMapper;
import cn.lcxjj.pojo.Attention;
import cn.lcxjj.pojo.HostUser;
import cn.lcxjj.service.AttentionService;

@Service
public class AttentionServiceImpl implements AttentionService {
	
	@Autowired
	private AttentionMapper attentionMapper;

	@Override
	public int countUser(String attentionUserName) {
		return attentionMapper.countUser(attentionUserName);
	}

	@Override
	public int countAttentionUser(String userName) {
		return attentionMapper.countAttentionUser(userName);
	}

	@Override
	public List<Attention> selectByUserName(String userName) {
		return attentionMapper.selectByUserName(userName);
	}

	@Override
	public List<Attention> selectByAttentionUserName(String attentionUserName) {
		return attentionMapper.selectByAttentionUserName(attentionUserName);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return attentionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<HostUser> selectHostUser() {
		return attentionMapper.selectHostUser();
	}

	@Override
	public int saveAttention(Attention attention) {
		if(attention == null){
			return -1;
		}
		return attentionMapper.insertSelective(attention);
	}
	
	
}
