package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.Vacation;
import com.qjk.bysj.pojo.vo.VacationCustom;
import com.qjk.bysj.pojo.vo.VacationQuery;
import dto.Order;
import dto.Page;
import dto.Result;

import java.util.List;

public interface VacationService {
    Result<VacationCustom> listVacationByPage(Page page, Order order, VacationQuery query);
    int deleteBatch(List ids);
    int saveVacation(VacationCustom vacation);
    Vacation selectById(long tid);
    int updateVacation(VacationCustom vacation);
}
