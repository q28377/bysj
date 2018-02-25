package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.Staff;
import com.qjk.bysj.pojo.vo.DepartmentQuery;
import com.qjk.bysj.pojo.vo.StaffCustom;
import com.qjk.bysj.pojo.vo.StaffQuery;
import dto.Order;
import dto.Page;
import dto.Result;

import java.util.List;

public interface StaffService {
    Result<StaffCustom> listStaffByPage(Page page, Order order, StaffQuery query);
    int deleteBatch(List ids);
    int saveStaff(StaffCustom staff);
    Staff selectById(long did);
    int updateStaff(StaffCustom staff);
}
