package cn.lcxjj.pojo;

import java.util.Date;
import java.util.List;

public class Article {
    private Integer id;

	private String articleTitle;

	private Date createTime;

	private Integer articleClick;

	private String userName;

	private Byte typeId;
	
	private String typeName;

	private Integer articleType;

	private String articleSummary;

	private Byte articleUp;

	private Byte articleSupport;

	private String showImage;

	private String articleContent;
	
	/**
	 * 评论数量
	 */
	private Integer commentsCount;
	
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

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle == null ? null : articleTitle.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getArticleClick() {
		return articleClick;
	}

	public void setArticleClick(Integer articleClick) {
		this.articleClick = articleClick;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public Byte getTypeId() {
		return typeId;
	}

	public void setTypeId(Byte typeId) {
		this.typeId = typeId;
	}

	public Integer getArticleType() {
		return articleType;
	}

	public void setArticleType(Integer articleType) {
		this.articleType = articleType;
	}

	public String getArticleSummary() {
		return articleSummary;
	}

	public void setArticleSummary(String articleSummary) {
		this.articleSummary = articleSummary == null ? null : articleSummary.trim();
	}

	public Byte getArticleUp() {
		return articleUp;
	}

	public void setArticleUp(Byte articleUp) {
		this.articleUp = articleUp;
	}

	public Byte getArticleSupport() {
		return articleSupport;
	}

	public void setArticleSupport(Byte articleSupport) {
		this.articleSupport = articleSupport;
	}

	public String getShowImage() {
		return showImage;
	}

	public void setShowImage(String showImage) {
		this.showImage = showImage == null ? null : showImage.trim();
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent == null ? null : articleContent.trim();
	}
	
	public Integer getCommentsCount() {
		return commentsCount;
	}

	public void setCommentsCount(Integer commentsCount) {
		this.commentsCount = commentsCount;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", articleTitle=" + articleTitle + ", createTime=" + createTime + ", articleClick="
				+ articleClick + ", userName=" + userName + ", typeId=" + typeId + ", typeName=" + typeName
				+ ", articleType=" + articleType + ", articleSummary=" + articleSummary + ", articleUp=" + articleUp
				+ ", articleSupport=" + articleSupport + ", showImage=" + showImage + ", articleContent="
				+ articleContent + ", commentsCount=" + commentsCount + ", comments=" + comments + "]";
	}

	

	
	
}