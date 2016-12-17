package cn.lcxjj.mapper;

import java.util.List;
import java.util.Map;

import cn.lcxjj.pojo.Attention;
import cn.lcxjj.pojo.HostUser;

public interface AttentionMapper {
	
	/**
     * 获取十个热门博主
     * @return
     */
    List<HostUser> selectHostUser();
	
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
    
    /**
     * 必选参数 user_name，attention_user_name
     * @param map
     * @return 关注的主键 id 或者 null
     */
    Object isAttentioned(Map<String,String> map);
    
}