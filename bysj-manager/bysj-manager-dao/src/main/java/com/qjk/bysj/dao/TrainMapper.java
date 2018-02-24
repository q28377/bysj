package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Train;
import com.qjk.bysj.pojo.po.TrainExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TrainMapper {
    int countByExample(TrainExample example);

    int deleteByExample(TrainExample example);

    int deleteByPrimaryKey(Long tid);

    int insert(Train record);

    int insertSelective(Train record);

    List<Train> selectByExample(TrainExample example);

    Train selectByPrimaryKey(Long tid);

    int updateByExampleSelective(@Param("record") Train record, @Param("example") TrainExample example);

    int updateByExample(@Param("record") Train record, @Param("example") TrainExample example);

    int updateByPrimaryKeySelective(Train record);

    int updateByPrimaryKey(Train record);
}