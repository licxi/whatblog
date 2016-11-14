package cn.lcxjj.pojo;

public class SystemSetup {
    private Integer id;
    
    private String systemName;

    private Integer writeArticleMark;

    private Integer writeCommentMark;

    private Integer receiveCommentMark;

    private String daily;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    

    public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public Integer getWriteArticleMark() {
        return writeArticleMark;
    }

    public void setWriteArticleMark(Integer writeArticleMark) {
        this.writeArticleMark = writeArticleMark;
    }

    public Integer getWriteCommentMark() {
        return writeCommentMark;
    }

    public void setWriteCommentMark(Integer writeCommentMark) {
        this.writeCommentMark = writeCommentMark;
    }

    public Integer getReceiveCommentMark() {
        return receiveCommentMark;
    }

    public void setReceiveCommentMark(Integer receiveCommentMark) {
        this.receiveCommentMark = receiveCommentMark;
    }

    public String getDaily() {
        return daily;
    }

    public void setDaily(String daily) {
        this.daily = daily == null ? null : daily.trim();
    }

	public SystemSetup(Integer id, String systemName, Integer writeArticleMark, Integer writeCommentMark,
			Integer receiveCommentMark, String daily) {
		super();
		this.id = id;
		this.systemName = systemName;
		this.writeArticleMark = writeArticleMark;
		this.writeCommentMark = writeCommentMark;
		this.receiveCommentMark = receiveCommentMark;
		this.daily = daily;
	}

	public SystemSetup() {
		super();
	}

	@Override
	public String toString() {
		return "SystemSetup [id=" + id + ", systemName=" + systemName + ", writeArticleMark=" + writeArticleMark
				+ ", writeCommentMark=" + writeCommentMark + ", receiveCommentMark=" + receiveCommentMark + ", daily="
				+ daily + "]";
	}
    
    
}