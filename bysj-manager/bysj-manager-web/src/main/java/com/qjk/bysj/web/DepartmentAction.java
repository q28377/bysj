package com.qjk.bysj.web;

import com.qjk.bysj.pojo.po.Department;
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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
public class DepartmentAction {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DepartmentService departmentService;

    //访问jsp页面
    @RequestMapping("/department-list")
    public String departmentList(){
        return "department-list";
    }
    @RequestMapping("/department-add")
    public String departmentAdd(){
        return "department-add";
    }
    @RequestMapping("/department-editor")
    public String departmentEditor(){
        return "department-editor";
    }

    //查询所有，用于添加员工时的选择部门的下拉框的节点树
    @ResponseBody
    @RequestMapping(value = "/department/all", method = RequestMethod.POST)
    public List<TreeNode> listDepartment(){
        List<TreeNode> list = null;
        try {
            list = departmentService.listDepartment();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //分页查询
    @ResponseBody
    @RequestMapping(value = "/department/query", method = RequestMethod.POST)
    public Result<Department> listDepartmentByPage(Page page, Order order, DepartmentQuery query){
        Result<Department> list = null;
        try{
            list = departmentService.listDepartmentByPage(page,order,query);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //新增
    @ResponseBody
    @RequestMapping(value = "/department/add", method = RequestMethod.POST)
    public int saveDepartment(DepartmentCustom department){
        if(department.getTime()!=null&&department.getTime()!=""){
            //表单提交的日期为String类型。需要用子类接收后转换为Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = sdf.parse(department.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            department.setCreatetime(date);
        }

        department.setStatus(1);
        int i = 0;
        try{
            i = departmentService.saveDepartment(department);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //批量删除（修改状态为0）
    @ResponseBody
    @RequestMapping(value = "/department/batch", method = RequestMethod.POST)
    public int deleteBatch(@RequestParam("ids[]")List ids){
        int i = 0;
        try {
            i = departmentService.deleteBatch(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //点击编辑按钮，查询当前选中项相关信息，数据回显到修改页面
    @RequestMapping("/department/update/{did}")
    public String getDepartmentById(@PathVariable("did")Integer did, Model model){
        Department department = null;
        try {
            department = departmentService.selectById(did);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        model.addAttribute("department",department);
        //修改页面的视图
        return "department-editor";
    }

    //编辑的提交
    @ResponseBody
    @RequestMapping(value="/department/update",method = RequestMethod.POST)
    public int updateDepartment(DepartmentCustom department){
        if(department.getTime()!=null&&department.getTime()!=""){
            //表单提交的日期为String类型。需要用子类接收后转换为Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = sdf.parse(department.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            department.setCreatetime(date);
        }

        int i = 0;
        try {
            i = departmentService.updateDepartment(department);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return  i;
    }
}
