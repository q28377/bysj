package com.qjk.bysj.service.impl;

import com.qjk.bysj.dao.StaffCustomMapper;
import com.qjk.bysj.dao.StaffMapper;
import com.qjk.bysj.pojo.po.Staff;
import com.qjk.bysj.pojo.po.StaffExample;
import com.qjk.bysj.pojo.vo.StaffCustom;
import com.qjk.bysj.pojo.vo.StaffQuery;
import com.qjk.bysj.service.StaffService;
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
public class StaffServiceImpl implements StaffService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StaffMapper staffMapper;
    @Autowired
    private StaffCustomMapper staffCustomMapper;

    @Override
    public Result<StaffCustom> listStaffByPage(Page page, Order order, StaffQuery query) {
        Result<StaffCustom> result = null;
        try {
            //0 创建一个Map封装前台传递过来的参数
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", page);
            map.put("order", order);
            map.put("query", query);
            //1 创建一个响应参数实体类
            result = new Result<StaffCustom>();
            //2 对total进行设值(符合条件的总记录数)
            int total = staffCustomMapper.countStaff(map);
            result.setTotal(total);
            //3 对rows进行设值(指定页码显示记录集合)
            List<StaffCustom> list = staffCustomMapper.listStaffByPage(map);
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
                Staff staff = null;
                long id = Long.parseLong((String) ids.get(i));
                staff = staffMapper.selectByPrimaryKey(id);
                staff.setStatus(0);

                //创建更新模板
                StaffExample example = new StaffExample();
                StaffExample.Criteria criteria = example.createCriteria();
                criteria.andSidEqualTo(id);
                //执行
                i += staffMapper.updateByExample(staff, example);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
    @Override
    public int saveStaff(StaffCustom staff){
        int i = 0;
        try{
            i = staffMapper.insert(staff);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public Staff selectById(long did) {
        Staff staff = null;
        try {
            staff = staffMapper.selectByPrimaryKey(did);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return staff;
    }

    @Override
    public int updateStaff(StaffCustom staff) {
        int i = 0 ;
        try {
            //创建更新模板
            StaffExample example = new StaffExample();
            StaffExample.Criteria criteria = example.createCriteria();
            criteria.andSidEqualTo(staff.getSid());
            //执行
            i = staffMapper.updateByExample(staff,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
