package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.Message;

public interface MessageMapper {
	/**
	 * 删除某条留言
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);

    
    int insert(Message message);

    /**
     * 插入一条留言
     * @param record
     * @return
     */
    int insertSelective(Message message);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message message);

    int updateByPrimaryKey(Message message);
    
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
}