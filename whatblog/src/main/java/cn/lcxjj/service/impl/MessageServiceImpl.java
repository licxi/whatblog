package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.MessageMapper;
import cn.lcxjj.pojo.Message;
import cn.lcxjj.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public int userMessageCount(String userName) {
		return messageMapper.userMessageCount(userName);
	}

	@Override
	public List<Message> getMessages(String userName) {
		return messageMapper.getMessages(userName);
	}

	@Override
	public int deleteByPrimaryKey(String userName,Integer id) {
		Message message = messageMapper.selectByPrimaryKey(id);
		if(message.getUserName().equals(userName)){
			return messageMapper.deleteByPrimaryKey(id);
		} else {
			return 0;
		}
	}

	@Override
	public int insertSelective(Message message) {
		if(message == null){
			return 0;
		}
		return messageMapper.insertSelective(message);
	}

}
