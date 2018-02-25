package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Staff;
import com.qjk.bysj.pojo.vo.StaffCustom;

import java.util.List;
import java.util.Map;

public interface StaffCustomMapper {
    int countStaff(Map<String, Object> map);
    List<StaffCustom> listStaffByPage(Map<String, Object> map);

    void updateByIds(List ids);
}
