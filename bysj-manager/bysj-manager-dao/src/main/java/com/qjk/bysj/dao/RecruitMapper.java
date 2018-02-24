package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Recruit;
import com.qjk.bysj.pojo.po.RecruitExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecruitMapper {
    int countByExample(RecruitExample example);

    int deleteByExample(RecruitExample example);

    int deleteByPrimaryKey(Long rid);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    List<Recruit> selectByExample(RecruitExample example);

    Recruit selectByPrimaryKey(Long rid);

    int updateByExampleSelective(@Param("record") Recruit record, @Param("example") RecruitExample example);

    int updateByExample(@Param("record") Recruit record, @Param("example") RecruitExample example);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKey(Recruit record);
}