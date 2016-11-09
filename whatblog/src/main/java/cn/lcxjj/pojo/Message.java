package cn.lcxjj.pojo;

import java.util.Date;

public class Message {
    
	private Integer id;

    private String userName;
    
    private String nickname;

    private String content;

    private String fromUserName;
    
    private String fromNickname;
    
    private Date time;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName == null ? null : fromUserName.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFromNickname() {
		return fromNickname;
	}

	public void setFromNickname(String fromNickname) {
		this.fromNickname = fromNickname;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", userName=" + userName + ", nickname=" + nickname + ", content=" + content
				+ ", fromUserName=" + fromUserName + ", fromNickname=" + fromNickname + ", time=" + time + "]";
	}

	
    
}