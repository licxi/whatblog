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

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return typeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Type type) {
		if(type == null){
			return -1;
		}
		return typeMapper.insert(type);
	}

	@Override
	public int insertSelective(Type type) {
		if(type == null){
			return -1;
		}
		return typeMapper.insertSelective(type);
	}

	@Override
	public Type selectByPrimaryKey(Integer id) {
		return typeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Type type) {
		if(type == null){
			return -1;
		}
		return typeMapper.updateByPrimaryKeySelective(type);
	}

}
