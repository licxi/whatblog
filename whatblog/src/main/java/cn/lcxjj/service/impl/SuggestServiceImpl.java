package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.SuggestMapper;
import cn.lcxjj.pojo.Suggest;
import cn.lcxjj.service.SuggestService;

@Service
public class SuggestServiceImpl implements SuggestService {

	@Autowired
	private SuggestMapper suggestMapper;
	
	
	@Override
	public int savaSuggest(Suggest suggest) {
		if(suggest == null){
			return 0;
		}
		return suggestMapper.insertSelective(suggest);
	}


	@Override
	public int suggestCount() {
		return suggestMapper.suggestCount();
	}


	@Override
	public List<Suggest> selectAll() {
		return suggestMapper.selectAll();
	}


	@Override
	public int deleteBySuggestId(int suggestId) {
		return suggestMapper.deleteByPrimaryKey(suggestId);
	}
	
	

}
