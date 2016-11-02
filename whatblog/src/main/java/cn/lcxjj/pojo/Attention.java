package cn.lcxjj.pojo;

import java.util.Date;

public class Attention {
    private Integer id;

    private String userName;

    private String attentionUserName;

    private Date attentionTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getAttentionUserName() {
        return attentionUserName;
    }

    public void setAttentionUserName(String attentionUserName) {
        this.attentionUserName = attentionUserName == null ? null : attentionUserName.trim();
    }

    public Date getAttentionTime() {
        return attentionTime;
    }

    public void setAttentionTime(Date attentionTime) {
        this.attentionTime = attentionTime;
    }

	@Override
	public String toString() {
		return "Attention [id=" + id + ", userName=" + userName + ", attentionUserName=" + attentionUserName
				+ ", attentionTime=" + attentionTime + "]";
	}
    
    
}