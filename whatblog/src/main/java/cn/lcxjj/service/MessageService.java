package cn.lcxjj.service;

public interface MessageService {
	/**
     * 获取某个博客（用户）得到的留言
     * @param userName
     * @return
     */
	int userMessageCount(String userName);
}
