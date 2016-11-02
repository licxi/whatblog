package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.Attention;

/**
 * 关注相关操作
 * @author TrueLE
 *
 */
public interface AttentionService {
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
