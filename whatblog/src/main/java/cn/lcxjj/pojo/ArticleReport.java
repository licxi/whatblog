package cn.lcxjj.pojo;

import java.util.Date;

public class ArticleReport {
    private Integer id;

    private String userName;
    
    private String nickname;

    private String reportContent;

    private String reportedUserName;
    
    private String reportedNickname;

    private Integer reportedArticleId;
    
    private String reportedArticleTitle;

    private String originalArticleUrl;

    private String originalArticleTitle;

    private Date time;

    private Integer processResult;
    
    public ArticleReport(){}
    
    

    public ArticleReport(String userName, String reportContent, String reportedUserName, Integer reportedArticleId) {
		super();
		this.userName = userName;
		this.reportContent = reportContent;
		this.reportedUserName = reportedUserName;
		this.reportedArticleId = reportedArticleId;
	}

	public ArticleReport(String userName, String reportContent, String reportedUserName,
			Integer reportedArticleId, String originalArticleUrl, String originalArticleTitle) {
		super();
		this.userName = userName;
		this.reportContent = reportContent;
		this.reportedUserName = reportedUserName;
		this.reportedArticleId = reportedArticleId;
		this.originalArticleUrl = originalArticleUrl;
		this.originalArticleTitle = originalArticleTitle;
	}

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

    public Integer getReportedArticleId() {
        return reportedArticleId;
    }

    public void setReportedArticleId(Integer reportedArticleId) {
        this.reportedArticleId = reportedArticleId;
    }
    
    

    public String getReportedArticleTitle() {
		return reportedArticleTitle;
	}

	public void setReportedArticleTitle(String reportedArticleTitle) {
		this.reportedArticleTitle = reportedArticleTitle;
	}

	public String getOriginalArticleUrl() {
        return originalArticleUrl;
    }

    public void setOriginalArticleUrl(String originalArticleUrl) {
        this.originalArticleUrl = originalArticleUrl == null ? null : originalArticleUrl.trim();
    }

    public String getOriginalArticleTitle() {
        return originalArticleTitle;
    }

    public void setOriginalArticleTitle(String originalArticleTitle) {
        this.originalArticleTitle = originalArticleTitle == null ? null : originalArticleTitle.trim();
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
		ArticleReport other = (ArticleReport) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ArticleReport [id=" + id + ", userName=" + userName + ", nickname=" + nickname + ", reportContent="
				+ reportContent + ", reportedUserName=" + reportedUserName + ", reportedNickname=" + reportedNickname
				+ ", reportedArticleId=" + reportedArticleId + ", reportedArticleTitle=" + reportedArticleTitle
				+ ", originalArticleUrl=" + originalArticleUrl + ", originalArticleTitle=" + originalArticleTitle
				+ ", time=" + time + ", processResult=" + processResult + "]";
	}

	
    
    
}