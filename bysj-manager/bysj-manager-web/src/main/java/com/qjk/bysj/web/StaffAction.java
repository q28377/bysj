package com.qjk.bysj.web;

import com.qjk.bysj.pojo.po.Staff;
import com.qjk.bysj.pojo.vo.StaffCustom;
import com.qjk.bysj.pojo.vo.StaffQuery;
import com.qjk.bysj.service.StaffService;
import dto.Order;
import dto.Page;
import dto.Result;
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
public class StaffAction {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StaffService staffService;

    //访问jsp页面
    @RequestMapping("/staff-list")
    public String staffList(){
        return "staff-list";
    }
    @RequestMapping("/staff-add")
    public String staffAdd(){
        return "staff-add";
    }
    @RequestMapping("/staff-editor")
    public String staffEditor(){
        return "staff-editor";
    }


    //分页查询
    @ResponseBody
    @RequestMapping(value = "/staff/query", method = RequestMethod.POST)
    public Result<StaffCustom> listStaffByPage(Page page, Order order, StaffQuery query){
        Result<StaffCustom> list = null;
        try{
            list = staffService.listStaffByPage(page,order,query);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //批量删除（修改状态为0）
    @ResponseBody
    @RequestMapping(value = "/staff/batch", method = RequestMethod.POST)
    public int deleteBatch(@RequestParam("ids[]")List ids){
        int i = 0;
        try {
            i = staffService.deleteBatch(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //新增
    @ResponseBody
    @RequestMapping(value = "/staff/add", method = RequestMethod.POST)
    public int saveStaff(StaffCustom staff){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;
        Date date3 = null;
        if(staff.getJoin()!=null&&staff.getJoin()!=""){
            try {
                date1 = sdf.parse(staff.getJoin());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            staff.setBegin(date1);
        }
        if(staff.getExit()!=null&&staff.getExit()!=""){
            try {
                date2 = sdf.parse(staff.getExit());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            staff.setEnd(date2);
        }
        if(staff.getBrith()!=null&&staff.getBrith()!=""){
            try {
                date3 = sdf.parse(staff.getBrith());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            staff.setBrithday(date3);
        }
        staff.setStatus(1);
        int i = 0;
        try{
            i = staffService.saveStaff(staff);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }



    //点击编辑按钮，查询当前选中项相关信息，数据回显到修改页面
    @RequestMapping("/staff/update/{sid}")
    public String getStaffById(@PathVariable("sid")long sid, Model model){
        Staff staff = null;
        try {
            staff = staffService.selectById(sid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        model.addAttribute("staff",staff);
        //修改页面的视图
        return "staff-editor";
    }

    //编辑的提交
    @ResponseBody
    @RequestMapping(value="/staff/update",method = RequestMethod.POST)
    public int updateStaff(StaffCustom staff){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;
        Date date3 = null;
        if(staff.getJoin()!=null&&staff.getJoin()!=""){
            try {
                date1 = sdf.parse(staff.getJoin());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            staff.setBegin(date1);
        }
        if(staff.getExit()!=null&&staff.getExit()!=""){
            try {
                date2 = sdf.parse(staff.getExit());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            staff.setEnd(date2);
        }
        if(staff.getBrith()!=null&&staff.getBrith()!=""){
            try {
                date3 = sdf.parse(staff.getBrith());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            staff.setBrithday(date3);
        }

        int i = 0;
        try {
            i = staffService.updateStaff(staff);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return  i;
    }
}
