package cn.lcxjj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lcxjj.mapper.ArticleReportMapper;
import cn.lcxjj.pojo.ArticleReport;
import cn.lcxjj.service.ArticleReportService;

@Service
public class ArticleReportServiceImpl implements ArticleReportService {

	@Autowired
	private ArticleReportMapper articleReportMapper;
	
	@Override
	public int saveArticleReport(ArticleReport articleReport) {
		if(articleReport == null){
			return -1;
		}
		return articleReportMapper.insertSelective(articleReport);
	}

	@Override
	public List<ArticleReport> selectAll() {
		return articleReportMapper.selectAll();
	}

}
