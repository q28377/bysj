package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Vacation;
import com.qjk.bysj.pojo.vo.VacationCustom;

import java.util.List;
import java.util.Map;

public interface VacationCustomMapper {
    int countVacation(Map<String, Object> map);
    List<VacationCustom> listVacationByPage(Map<String, Object> map);
}
