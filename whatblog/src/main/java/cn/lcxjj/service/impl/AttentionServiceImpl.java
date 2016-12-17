package cn.lcxjj.service.impl;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.options;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		int result = isAttentioned(attention.getUserName(),attention.getAttentionUserName());
		return result > 0 ?-1:attentionMapper.insertSelective(attention);
	}

	@Override
	public int isAttentioned(String user_name, String attention_user_name) {
		if(user_name == null || attention_user_name == null){
			return 0;
		}
		Map<String,String> map = new HashMap<String,String>();
		map.put("user_name", user_name);
		map.put("attention_user_name", attention_user_name);
		Object result = attentionMapper.isAttentioned(map);
		if(result == null){
			return 0;
		}
		return (Integer) result;
	}
	
	
}
