package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Attention;
import cn.lcxjj.pojo.HostUser;

/**
 * 关注相关操作
 * @author TrueLE
 *
 */
public interface AttentionService {
	
	/**
	 * 删除一条关注记录
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);
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
    
    /**
     * 获取十个热门博主
     * @return
     */
    List<HostUser> selectHostUser();
    
    int saveAttention(Attention attention);
    
    /**如果有关注，返回该关注的主键 ，否则返回
     * 
     * @param user_name
     * @param attention_user_name
     * @return 如果有关注，返回该关注的主键,如果没有关注，则返回0
     */
    int isAttentioned(String user_name,String attention_user_name);
}
