package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Pay;
import com.qjk.bysj.pojo.vo.PayCustom;

import java.util.List;
import java.util.Map;

public interface PayCustomMapper {
    int countPay(Map<String, Object> map);
    List<PayCustom> listPayByPage(Map<String, Object> map);
    //void updateByIds(List ids);
}
