package com.qjk.bysj.service.impl;

import com.qjk.bysj.dao.VacationCustomMapper;
import com.qjk.bysj.dao.VacationMapper;
import com.qjk.bysj.pojo.po.Vacation;
import com.qjk.bysj.pojo.po.VacationExample;
import com.qjk.bysj.pojo.vo.VacationCustom;
import com.qjk.bysj.pojo.vo.VacationQuery;
import com.qjk.bysj.service.VacationService;
import dto.Order;
import dto.Page;
import dto.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VacationServiceImpl implements VacationService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private VacationMapper vacationMapper;
    @Autowired
    private VacationCustomMapper vacationCustomMapper;

    @Override
    public Result<VacationCustom> listVacationByPage(Page page, Order order, VacationQuery query) {

        Result<VacationCustom> result = null;
        try {
            //0 创建一个Map封装前台传递过来的参数
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", page);
            map.put("order", order);
            map.put("query", query);
            //1 创建一个响应参数实体类
            result = new Result<VacationCustom>();
            //2 对total进行设值(符合条件的总记录数)
            int total = vacationCustomMapper.countVacation(map);
            result.setTotal(total);
            //3 对rows进行设值(指定页码显示记录集合)
            List<VacationCustom> list = vacationCustomMapper.listVacationByPage(map);
            result.setRows(list);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return result;
    }

   @Override
    public int deleteBatch(List ids) {
        int i=0;
        try {
            for(int j=0;j<ids.size();j++) {
                Vacation vacation = null;
                long id = Long.parseLong((String) ids.get(i));
                vacation = vacationMapper.selectByPrimaryKey(id);
                vacation.setStatus(0);

                //创建更新模板
                VacationExample example = new VacationExample();
                VacationExample.Criteria criteria = example.createCriteria();
                criteria.andVidEqualTo(id);
                //执行
                i += vacationMapper.updateByExample(vacation, example);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int saveVacation(VacationCustom vacation) {
        int i = 0;
        try{
            i = vacationMapper.insert(vacation);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
/*
    @Override
    public Vacation selectById(long tid) {
        Vacation vacation = null;
        try {
            vacation = vacationMapper.selectByPrimaryKey(tid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return vacation;
    }

    @Override
    public int updateVacation(VacationCustom vacation) {
        int i = 0 ;
        try {
            //创建更新模板
            VacationExample example = new VacationExample();
            VacationExample.Criteria criteria = example.createCriteria();
            criteria.andTidEqualTo(vacation.getTid());
            //执行
            i = vacationMapper.updateByExample(vacation,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }*/
}
