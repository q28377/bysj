package com.qjk.bysj.web;

import com.qjk.bysj.pojo.po.Vacation;
import com.qjk.bysj.pojo.vo.VacationCustom;
import com.qjk.bysj.pojo.vo.VacationQuery;
import com.qjk.bysj.service.VacationService;
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
public class VacationAction {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private VacationService vacationService;

    //访问vacation-list
    @RequestMapping("/vacation-list")
    public String vacationList(){
        return "vacation-list";
    }
    @RequestMapping("/vacation-add")
    public String vacationAdd(){
        return "vacation-add";
    }
    @RequestMapping("/vacation-editor")
    public String vacationEditor(){
        return "vacation-editor";
    }


    //分页查询请假信息
    @ResponseBody
    @RequestMapping(value = "/vacation/query", method = RequestMethod.POST)
    public Result<VacationCustom> listVacationByPage(Page page, Order order, VacationQuery query){
        Result<VacationCustom> list = null;
        try{
            list = vacationService.listVacationByPage(page,order,query);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //批量删除请假信息（修改请假状态为0）
    @ResponseBody
    @RequestMapping(value = "/vacation/batch", method = RequestMethod.POST)
    public int deleteBatch(@RequestParam("ids[]")List ids){
        int i = 0;
        try {
            i = vacationService.deleteBatch(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //新增请假信息
    @ResponseBody
    @RequestMapping(value = "/vacation/add", method = RequestMethod.POST)
    public int saveVacation(VacationCustom vacation){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = null;
        Date date2 = null;
        if(vacation.getStart()!=null&&vacation.getStart()!=""){
            try {
                date1 = sdf.parse(vacation.getStart());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            vacation.setBegin(date1);
        }
        if(vacation.getFinish()!=null&&vacation.getFinish()!=""){
            try {
                date2 = sdf.parse(vacation.getFinish());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            vacation.setEnd(date2);
        }
        vacation.setStatus(1);
        int i = 0;
        try{
            i = vacationService.saveVacation(vacation);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //点击编辑按钮，查询当前选中项相关信息，数据回显到修改页面
    @RequestMapping("/vacation/update/{vid}")
    public String getReginsById(@PathVariable("vid")Long vid, Model model){
        Vacation vacation = null;
        try {
            vacation = vacationService.selectById(vid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        model.addAttribute("vacation",vacation);
        //修改页面的视图
        return "vacation-editor";
    }

    //编辑的提交
    @ResponseBody
    @RequestMapping(value="/vacation/update",method = RequestMethod.POST)
    public int updateVacation(VacationCustom vacation){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = null;
        Date date2 = null;
        if(vacation.getStart()!=null&&vacation.getStart()!=""){
            try {
                date1 = sdf.parse(vacation.getStart());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            vacation.setBegin(date1);
        }
        if(vacation.getFinish()!=null&&vacation.getFinish()!=""){
            try {
                date2 = sdf.parse(vacation.getFinish());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            vacation.setEnd(date2);
        }

        int i = 0;
        try {
            i = vacationService.updateVacation(vacation);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return  i;
    }
}
