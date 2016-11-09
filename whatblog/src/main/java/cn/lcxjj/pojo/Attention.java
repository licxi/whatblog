package cn.lcxjj.pojo;

import java.util.Date;

public class Attention {
    private Integer id;

    private String userName;

    private String nickname;
    
    private String headUrl;
    
    private String attentionUserName;
    
    private String attentionNickname;
    
    private String attentionHeadUrl;

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAttentionNickname() {
		return attentionNickname;
	}

	public void setAttentionNickname(String attentionNickname) {
		this.attentionNickname = attentionNickname;
	}
	
	

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public String getAttentionHeadUrl() {
		return attentionHeadUrl;
	}

	public void setAttentionHeadUrl(String attentionHeadUrl) {
		this.attentionHeadUrl = attentionHeadUrl;
	}

	@Override
	public String toString() {
		return "Attention [id=" + id + ", userName=" + userName + ", nickname=" + nickname + ", attentionUserName="
				+ attentionUserName + ", attentionNickname=" + attentionNickname + ", attentionTime=" + attentionTime
				+ "]";
	}

	
    
    
}