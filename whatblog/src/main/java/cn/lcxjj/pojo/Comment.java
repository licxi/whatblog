package cn.lcxjj.pojo;

import java.util.Date;
import java.util.List;

public class Comment {
    private Integer id;

    private String userName;
    
    private String nickname;

    private String content;

    private Date time;

    private String toUserName;
    
    private String toNickname;

    private Integer articleId;
    
    /**
	 * 评论内容
	 * @return
	 */
	private List<Comment> comments;

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
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public String getToNickname() {
		return toNickname;
	}

	public void setToNickname(String toNickname) {
		this.toNickname = toNickname;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", userName=" + userName + ", nickname=" + nickname + ", content=" + content
				+ ", time=" + time + ", toUserName=" + toUserName + ", toNickname=" + toNickname + ", articleId="
				+ articleId + ", comments=" + comments + "]";
	}

	

   
}