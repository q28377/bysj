package com.qjk.bysj.service.impl;

import com.qjk.bysj.dao.TrainCustomMapper;
import com.qjk.bysj.dao.TrainMapper;
import com.qjk.bysj.pojo.po.Train;
import com.qjk.bysj.pojo.po.TrainExample;
import com.qjk.bysj.pojo.vo.TrainCustom;
import com.qjk.bysj.pojo.vo.TrainQuery;
import com.qjk.bysj.service.TrainService;
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
public class TrainServiceImpl implements TrainService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TrainMapper trainMapper;
    @Autowired
    private TrainCustomMapper trainCustomMapper;

    @Override
    public Result<Train> listTrainByPage(Page page, Order order, TrainQuery query) {
        Result<Train> result = null;
        try {
            //0 创建一个Map封装前台传递过来的参数
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", page);
            map.put("order", order);
            map.put("query", query);
            //1 创建一个响应参数实体类
            result = new Result<Train>();
            //2 对total进行设值(符合条件的总记录数)
            int total = trainCustomMapper.countTrain(map);
            result.setTotal(total);
            //3 对rows进行设值(指定页码显示记录集合)
            List<Train> list = trainCustomMapper.listTrainByPage(map);
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
                Train train = null;
                long id = Long.parseLong((String) ids.get(i));
                train = trainMapper.selectByPrimaryKey(id);
                train.setStatus(0);

                //创建更新模板
                TrainExample example = new TrainExample();
                TrainExample.Criteria criteria = example.createCriteria();
                criteria.andTidEqualTo(id);
                //执行
                i += trainMapper.updateByExample(train, example);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int saveTrain(TrainCustom train) {
        int i = 0;
        try{
                i = trainMapper.insert(train);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public Train selectById(long tid) {
        Train train = null;
        try {
            train = trainMapper.selectByPrimaryKey(tid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return train;
    }

    @Override
    public int updateTrain(TrainCustom train) {
        int i = 0 ;
        try {
            //创建更新模板
            TrainExample example = new TrainExample();
            TrainExample.Criteria criteria = example.createCriteria();
            criteria.andTidEqualTo(train.getTid());
            //执行
            i = trainMapper.updateByExample(train,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
