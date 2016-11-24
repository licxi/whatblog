package cn.lcxjj.mapper;

import java.util.List;

import cn.lcxjj.pojo.ArticleReport;

public interface ArticleReportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ArticleReport record);

    int insertSelective(ArticleReport record);

    ArticleReport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ArticleReport record);

    int updateByPrimaryKey(ArticleReport record);
    
    List<ArticleReport> selectAll();
}