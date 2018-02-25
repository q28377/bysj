package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.Train;
import com.qjk.bysj.pojo.vo.TrainCustom;
import com.qjk.bysj.pojo.vo.TrainQuery;
import dto.Order;
import dto.Page;
import dto.Result;

import java.util.List;

public interface TrainService {
    Result<Train> listTrainByPage(Page page, Order order, TrainQuery query);
    int deleteBatch(List ids);
    int saveTrain(TrainCustom train);
    Train selectById(long tid);
    int updateTrain(TrainCustom train);
}
