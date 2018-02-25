package com.qjk.bysj.web;

import com.qjk.bysj.pojo.po.Train;
import com.qjk.bysj.pojo.vo.TrainCustom;
import com.qjk.bysj.pojo.vo.TrainQuery;
import com.qjk.bysj.service.TrainService;
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
public class TrainAction {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private TrainService trainService;

    //访问train-list
    @RequestMapping("/train-list")
    public String trainList(){
        return "train-list";
    }
    @RequestMapping("/train-add")
    public String trainAdd(){
        return "train-add";
    }
    @RequestMapping("/train-editor")
    public String trainEditor(){
        return "train-editor";
    }


    //分页查询培训信息
    @ResponseBody
    @RequestMapping(value = "/train/query", method = RequestMethod.POST)
    public Result<Train> listTrainByPage(Page page, Order order, TrainQuery query){
        Result<Train> list = null;
        try{
            list = trainService.listTrainByPage(page,order,query);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //批量删除培训信息（修改培训状态为0）
    @ResponseBody
    @RequestMapping(value = "/train/batch", method = RequestMethod.POST)
    public int deleteBatch(@RequestParam("ids[]")List ids){
        int i = 0;
        try {
            i = trainService.deleteBatch(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //新增培训信息
    @ResponseBody
    @RequestMapping(value = "/train/add", method = RequestMethod.POST)
    public int saveTrain(TrainCustom train){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;
        if(train.getStart()!=null&&train.getStart()!=""){
            try {
                date1 = sdf.parse(train.getStart());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            train.setBegain(date1);
        }
        if(train.getFinish()!=null&&train.getFinish()!=""){
            try {
                date2 = sdf.parse(train.getFinish());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            train.setEnd(date2);
        }
        train.setStatus(1);
        int i = 0;
        try{
            i = trainService.saveTrain(train);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //点击编辑按钮，查询当前选中项相关信息，数据回显到修改页面
    @RequestMapping("/train/update/{tid}")
    public String getReginsById(@PathVariable("tid")Integer tid, Model model){
        Train train = null;
        try {
            train = trainService.selectById((long)tid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        model.addAttribute("train",train);
        //修改页面的视图
        return "train-editor";
    }

    //编辑的提交
    @ResponseBody
    @RequestMapping(value="/train/update",method = RequestMethod.POST)
    public int updateTrain(TrainCustom train){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;
        if(train.getStart()!=null&&train.getStart()!=""){
            try {
                date1 = sdf.parse(train.getStart());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            train.setBegain(date1);
        }
        if(train.getFinish()!=null&&train.getFinish()!=""){
            try {
                date2 = sdf.parse(train.getFinish());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            train.setEnd(date2);
        }

        int i = 0;
        try {
            i = trainService.updateTrain(train);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return  i;
    }
}
