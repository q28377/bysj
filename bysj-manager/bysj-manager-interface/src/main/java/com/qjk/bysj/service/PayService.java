package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.Pay;
import com.qjk.bysj.pojo.vo.PayCustom;
import com.qjk.bysj.pojo.vo.PayQuery;
import dto.Order;
import dto.Page;
import dto.Result;

import java.util.List;

public interface PayService {
    Result<PayCustom> listPayByPage(Page page, Order order, PayQuery query);
    int deleteBatch(List ids);
    int savePay(Pay pay);
    Pay selectById(long pid);
    int updatePay(Pay pay);
}
