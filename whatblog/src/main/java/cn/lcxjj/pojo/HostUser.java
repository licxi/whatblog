package cn.lcxjj.pojo;

public class HostUser {
	private String userName;
	private String nickname;
	private Integer attentionCount;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getAttentionCount() {
		return attentionCount;
	}
	public void setAttentionCount(Integer attentionCount) {
		this.attentionCount = attentionCount;
	}
	@Override
	public String toString() {
		return "HostUser [userName=" + userName + ", nickname=" + nickname + ", attentionCount=" + attentionCount + "]";
	}
	
	
}
