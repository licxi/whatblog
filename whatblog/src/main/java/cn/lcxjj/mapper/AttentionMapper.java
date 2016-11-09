package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.Attention;

public interface AttentionMapper {
	
	/**
	 * 删除一条关注记录
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);

    int insert(Attention attention);

    int insertSelective(Attention attention);

    Attention selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attention attention);

    int updateByPrimaryKey(Attention attention);
    
    /**
     * 获取有多少个人关注博
     * @param attentionUserName
     * @return
     */
    int countUser(String attentionUserName);
    
    /**
     * 获取关注了多少个博主
     * @param userName
     * @return
     */
    int countAttentionUser(String userName);
    /**
     * 根据用户名查找该用户关注的所有博主
     * @param userName
     * @return
     */
    List<Attention> selectByUserName(String userName);
    
    /**
     * 根据用户名查找所有关注他的用户
     * @param attentionUserName
     * @return
     */
    List<Attention> selectByAttentionUserName(String attentionUserName);
    
    
    
}