package com.qjk.bysj.service.impl;

import com.qjk.bysj.dao.DepartmentCustomMapper;
import com.qjk.bysj.dao.DepartmentMapper;
import com.qjk.bysj.dao.StaffCustomMapper;
import com.qjk.bysj.pojo.po.Department;
import com.qjk.bysj.pojo.po.DepartmentExample;
import com.qjk.bysj.pojo.vo.DepartmentCustom;
import com.qjk.bysj.pojo.vo.DepartmentQuery;
import com.qjk.bysj.service.DepartmentService;
import dto.Order;
import dto.Page;
import dto.Result;
import dto.TreeNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private DepartmentCustomMapper departmentCustomMapper;
    @Autowired
    private StaffCustomMapper staffCustomMapper;

    @Override
    public List<TreeNode> listDepartment() {
        List<DepartmentCustom> list = null;
        try {
            //执行查询
            list = departmentCustomMapper.listDepartment();
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        List<TreeNode> resultList = new ArrayList<TreeNode>();
        //遍历原有集合
        for (int i=0;i<list.size();i++){
            TreeNode node = new TreeNode();
            Integer id1 = list.get(i).getDid();
            int id2 = id1;
            Long id3 = (long)id2;
            node.setId(id3);
            node.setText(list.get(i).getDname());
            node.setState("open");
            resultList.add(node);
        }
        return resultList;
    }

    @Override
    public Result<Department> listDepartmentByPage(Page page, Order order, DepartmentQuery query) {
        Result<Department> result = null;
        try {
            //0 创建一个Map封装前台传递过来的参数
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", page);
            map.put("order", order);
            map.put("query", query);
            //1 创建一个响应参数实体类
            result = new Result<Department>();
            //2 对total进行设值(符合条件的总记录数)
            int total = departmentCustomMapper.countDepartment(map);
            result.setTotal(total);
            //3 对rows进行设值(指定页码显示记录集合)
            List<Department> list = departmentCustomMapper.listDepartmentByPage(map);
            result.setRows(list);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return result;
    }

   @Override
    public int saveDepartment(Department department) {
        int i = 0;
        try{
            DepartmentExample departmentExample=new DepartmentExample();
            DepartmentExample.Criteria criteria=departmentExample.createCriteria();
            criteria.andDnameEqualTo(department.getDname());

            List<Department> list = departmentMapper.selectByExample(departmentExample);
            if(list.size()==0){
                i = departmentMapper.insert(department);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int deleteBatch(List ids) {
        int i=0;
        try {
            for(int j=0;j<ids.size();j++) {
                Department department = null;
                int id = Integer.parseInt((String) ids.get(i));
                department = departmentMapper.selectByPrimaryKey(id);
                department.setStatus(0);

                //创建更新模板
                DepartmentExample example = new DepartmentExample();
                DepartmentExample.Criteria criteria = example.createCriteria();
                criteria.andDidEqualTo(id);
                //执行
                i += departmentMapper.updateByExample(department, example);
            }
            //级联'删除'，将属于该部门的员工的部门did改为0
            staffCustomMapper.updateByIds(ids);

        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public Department selectById(int did) {
        Department department = null;
        try {
            department = departmentMapper.selectByPrimaryKey((Integer) did);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return department;
    }

    @Override
    public int updateDepartment(Department department) {
        int i = 0 ;
        try {
            //创建更新模板
            DepartmentExample example = new DepartmentExample();
            DepartmentExample.Criteria criteria = example.createCriteria();
            criteria.andDidEqualTo(department.getDid());
            //执行
            i = departmentMapper.updateByExample(department,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
