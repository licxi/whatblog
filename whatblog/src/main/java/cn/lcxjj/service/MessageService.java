package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Message;

public interface MessageService {
	/**
     * 获取某个博客（用户）得到的留言
     * @param userName
     * @return
     */
	int userMessageCount(String userName);
	
	/**
     * 获取用户收到的评论
     * @param userName
     * @return
     */
    List<Message> getMessages(String userName);
    
    /**
	 * 删除某条留言
	 * @param id
	 * @return 返回0为删除失败，大于零为成功
	 */
    int deleteByPrimaryKey(String userName,Integer id);
    
    int deleteByMessageId(Integer messageId);
    
    /**
     * 插入一条留言
     * @param record
     * @return
     */
    int insertSelective(Message message);
    
    /**
     * 获取全部留言内容
     * @return
     */
    List<Message> selectAll();
}
