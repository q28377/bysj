package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.Department;
import com.qjk.bysj.pojo.vo.DepartmentQuery;
import dto.Order;
import dto.Page;
import dto.Result;
import dto.TreeNode;

import java.util.List;

public interface DepartmentService {
    Result<Department> listDepartmentByPage(Page page, Order order, DepartmentQuery query);
    int saveDepartment(Department department);
    int deleteBatch(List ids);
    Department selectById(int did);
    int updateDepartment(Department department);

    List<TreeNode> listDepartment();
}
