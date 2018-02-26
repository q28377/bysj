package com.qjk.bysj.service.impl;

import com.qjk.bysj.dao.PayCustomMapper;
import com.qjk.bysj.dao.PayMapper;
import com.qjk.bysj.pojo.po.Pay;
import com.qjk.bysj.pojo.po.PayExample;
import com.qjk.bysj.pojo.vo.PayCustom;
import com.qjk.bysj.pojo.vo.PayQuery;
import com.qjk.bysj.service.PayService;
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
public class PayServiceImpl implements PayService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PayMapper payMapper;
    @Autowired
    private PayCustomMapper payCustomMapper;

    @Override
    public Result<PayCustom> listPayByPage(Page page, Order order, PayQuery query) {
        Result<PayCustom> result = null;
        try {
            //0 创建一个Map封装前台传递过来的参数
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", page);
            map.put("order", order);
            map.put("query", query);
            //1 创建一个响应参数实体类
            result = new Result<PayCustom>();
            //2 对total进行设值(符合条件的总记录数)
            int total = payCustomMapper.countPay(map);
            result.setTotal(total);
            //3 对rows进行设值(指定页码显示记录集合)
            List<PayCustom> list = payCustomMapper.listPayByPage(map);
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
                Pay pay = null;
                long id = Long.parseLong((String) ids.get(i));
                pay = payMapper.selectByPrimaryKey(id);
                pay.setStatus(0);

                //创建更新模板
                PayExample example = new PayExample();
                PayExample.Criteria criteria = example.createCriteria();
                criteria.andPidEqualTo(id);
                //执行
                i += payMapper.updateByExample(pay, example);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int savePay(Pay pay) {
        int i = 0;
        try{

            PayExample payExample=new PayExample();
            PayExample.Criteria criteria=payExample.createCriteria();
            criteria.andSidEqualTo(pay.getSid());//员工编号重复
            criteria.andStatusEqualTo(1);//且该工资未被删除

            List<Pay> list = payMapper.selectByExample(payExample);
            //工资不能有重复的未删除的员工编号
            if(list.size()==0){
                i = payMapper.insert(pay);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public Pay selectById(long pid) {
        Pay pay = null;
        try {
            pay = payMapper.selectByPrimaryKey(pid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return pay;
    }

    @Override
    public int updatePay(Pay pay) {
        int i = 0 ;
        try {
            //创建更新模板
            PayExample example = new PayExample();
            PayExample.Criteria criteria = example.createCriteria();
            criteria.andPidEqualTo(pay.getPid());
            //执行
            i = payMapper.updateByExample(pay,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
