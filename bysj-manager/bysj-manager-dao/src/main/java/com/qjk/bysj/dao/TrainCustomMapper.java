package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.Train;

import java.util.List;
import java.util.Map;

public interface TrainCustomMapper {
    int countTrain(Map<String, Object> map);
    List<Train> listTrainByPage(Map<String, Object> map);
}
