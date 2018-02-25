package com.qjk.bysj.pojo.vo;

import com.qjk.bysj.pojo.po.Train;

public class TrainCustom extends Train{
    private String start;
    private String finish;

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getFinish() {
        return finish;
    }

    public void setFinish(String finish) {
        this.finish = finish;
    }
}
