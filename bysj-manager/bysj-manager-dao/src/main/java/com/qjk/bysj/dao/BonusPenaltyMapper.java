package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.BonusPenalty;
import com.qjk.bysj.pojo.po.BonusPenaltyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BonusPenaltyMapper {
    int countByExample(BonusPenaltyExample example);

    int deleteByExample(BonusPenaltyExample example);

    int deleteByPrimaryKey(Long bid);

    int insert(BonusPenalty record);

    int insertSelective(BonusPenalty record);

    List<BonusPenalty> selectByExample(BonusPenaltyExample example);

    BonusPenalty selectByPrimaryKey(Long bid);

    int updateByExampleSelective(@Param("record") BonusPenalty record, @Param("example") BonusPenaltyExample example);

    int updateByExample(@Param("record") BonusPenalty record, @Param("example") BonusPenaltyExample example);

    int updateByPrimaryKeySelective(BonusPenalty record);

    int updateByPrimaryKey(BonusPenalty record);
}