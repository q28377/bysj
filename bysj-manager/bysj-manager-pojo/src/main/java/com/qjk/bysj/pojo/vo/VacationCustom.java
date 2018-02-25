package com.qjk.bysj.pojo.vo;

import com.qjk.bysj.pojo.po.Vacation;

public class VacationCustom extends Vacation{
    private String start;
    private String finish;
    private String name;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
