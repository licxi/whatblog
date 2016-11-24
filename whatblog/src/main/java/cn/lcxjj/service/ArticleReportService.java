package cn.lcxjj.service;

import java.util.List;

import cn.lcxjj.pojo.ArticleReport;

public interface ArticleReportService {
	int saveArticleReport(ArticleReport articleReport);
	List<ArticleReport> selectAll();
}
