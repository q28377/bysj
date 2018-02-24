package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Pay;
import com.qjk.bysj.pojo.po.PayExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayMapper {
    int countByExample(PayExample example);

    int deleteByExample(PayExample example);

    int deleteByPrimaryKey(Long pid);

    int insert(Pay record);

    int insertSelective(Pay record);

    List<Pay> selectByExample(PayExample example);

    Pay selectByPrimaryKey(Long pid);

    int updateByExampleSelective(@Param("record") Pay record, @Param("example") PayExample example);

    int updateByExample(@Param("record") Pay record, @Param("example") PayExample example);

    int updateByPrimaryKeySelective(Pay record);

    int updateByPrimaryKey(Pay record);
}