package cn.lcxjj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.MessageMapper;
import cn.lcxjj.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public int userMessageCount(String userName) {
		return messageMapper.userMessageCount(userName);
	}

}
