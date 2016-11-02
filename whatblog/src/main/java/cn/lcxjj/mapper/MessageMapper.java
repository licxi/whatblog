package cn.lcxjj.mapper;

import cn.lcxjj.pojo.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    
    /**
     * 获取某个博客（用户）得到的留言
     * @param userName
     * @return
     */
    int userMessageCount(String userName);
}