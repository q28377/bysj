package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Vacation;
import com.qjk.bysj.pojo.po.VacationExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VacationMapper {
    int countByExample(VacationExample example);

    int deleteByExample(VacationExample example);

    int deleteByPrimaryKey(Long vid);

    int insert(Vacation record);

    int insertSelective(Vacation record);

    List<Vacation> selectByExample(VacationExample example);

    Vacation selectByPrimaryKey(Long vid);

    int updateByExampleSelective(@Param("record") Vacation record, @Param("example") VacationExample example);

    int updateByExample(@Param("record") Vacation record, @Param("example") VacationExample example);

    int updateByPrimaryKeySelective(Vacation record);

    int updateByPrimaryKey(Vacation record);
}