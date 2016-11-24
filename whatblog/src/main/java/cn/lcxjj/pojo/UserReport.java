package cn.lcxjj.pojo;

import java.util.Date;

public class UserReport {
    private Integer id;

    private String userName;
    
    private String nickname;

    private String reportContent;

    private String reportedUserName;
    
    private String reportedNickname;

    private Date time;

    private Integer processResult;

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

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent == null ? null : reportContent.trim();
    }

    public String getReportedUserName() {
        return reportedUserName;
    }

    public void setReportedUserName(String reportedUserName) {
        this.reportedUserName = reportedUserName == null ? null : reportedUserName.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getProcessResult() {
        return processResult;
    }

    public void setProcessResult(Integer processResult) {
        this.processResult = processResult;
    }

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReportedNickname() {
		return reportedNickname;
	}

	public void setReportedNickname(String reportedNickname) {
		this.reportedNickname = reportedNickname;
	}

	
	
	public UserReport() {
	}

	public UserReport(Integer id, String userName, String reportContent, String reportedUserName, Date time, Integer processResult) {
		super();
		this.id = id;
		this.userName = userName;
		this.reportContent = reportContent;
		this.reportedUserName = reportedUserName;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserReport other = (UserReport) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserReport [id=" + id + ", userName=" + userName + ", nickname=" + nickname + ", reportContent="
				+ reportContent + ", reportedUserName=" + reportedUserName + ", reportedNickname=" + reportedNickname
				+ ", time=" + time + ", processResult=" + processResult + "]";
	}
    
    
}