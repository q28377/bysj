package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Department;
import com.qjk.bysj.pojo.vo.DepartmentCustom;

import java.util.List;
import java.util.Map;

public interface DepartmentCustomMapper {
    int countDepartment(Map<String, Object> map);
    List<Department> listDepartmentByPage(Map<String, Object> map);

    List<DepartmentCustom> listDepartment();
}
