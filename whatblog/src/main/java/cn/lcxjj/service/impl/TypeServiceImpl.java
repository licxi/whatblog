package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.TypeMapper;
import cn.lcxjj.pojo.Type;
import cn.lcxjj.service.TypeService;

@Service
public class TypeServiceImpl implements TypeService {

	@Autowired
	private TypeMapper typeMapper;
	
	@Override
	public List<Type> selectAll() {
		return typeMapper.selectAll();
	}

}
