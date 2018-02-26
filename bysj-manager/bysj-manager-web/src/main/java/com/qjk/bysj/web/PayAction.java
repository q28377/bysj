package com.qjk.bysj.web;

import com.qjk.bysj.pojo.po.Pay;
import com.qjk.bysj.pojo.vo.PayCustom;
import com.qjk.bysj.pojo.vo.PayQuery;
import com.qjk.bysj.service.PayService;
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

import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
public class PayAction {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PayService payService;

    //访问jsp页面
    @RequestMapping("/pay-list")
    public String payList(){
        return "pay-list";
    }
    @RequestMapping("/pay-add")
    public String payAdd(){
        return "pay-add";
    }
    @RequestMapping("/pay-editor")
    public String payEditor(){
        return "pay-editor";
    }


    //分页查询
    @ResponseBody
    @RequestMapping(value = "/pay/query", method = RequestMethod.POST)
    public Result<PayCustom> listPayByPage(Page page, Order order, PayQuery query){
        Result<PayCustom> list = null;
        try{
            list = payService.listPayByPage(page,order,query);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //批量删除（修改状态为0）
    @ResponseBody
    @RequestMapping(value = "/pay/batch", method = RequestMethod.POST)
    public int deleteBatch(@RequestParam("ids[]")List ids){
        int i = 0;
        try {
            i = payService.deleteBatch(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //新增
    @ResponseBody
    @RequestMapping(value = "/pay/add", method = RequestMethod.POST)
    public int savePay(Pay pay){
        pay.setStatus(1);
        int i = 0;
        try{
            i = payService.savePay(pay);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //点击编辑按钮，查询当前选中项相关信息，数据回显到修改页面
    @RequestMapping("/pay/update/{pid}")
    public String getPayById(@PathVariable("pid")long pid, Model model){
        Pay pay = null;
        try {
            pay = payService.selectById(pid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        model.addAttribute("pay",pay);
        //修改页面的视图
        return "pay-editor";
    }

    //编辑的提交
    @ResponseBody
    @RequestMapping(value="/pay/update",method = RequestMethod.POST)
    public int updatePay(Pay pay){
        int i = 0;
        try {
            i = payService.updatePay(pay);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return  i;
    }
}
