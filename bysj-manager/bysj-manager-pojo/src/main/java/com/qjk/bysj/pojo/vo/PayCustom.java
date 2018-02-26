package com.qjk.bysj.pojo.vo;

import com.qjk.bysj.pojo.po.Pay;

import java.math.RoundingMode;
import java.text.DecimalFormat;

public class PayCustom extends Pay{
    private String name;
    private String totalMoney;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    //计算总工资
    public String getTotalMoney() {
        //为null需要给初始值0
        if(this.getBasic()==null){
            this.setBasic((float)0);
        }
        if(this.getEat()==null){
            this.setEat((float)0);
        }
        if(this.getHouse()==null){
            this.setHouse((float)0);
        }
        if(this.getOther()==null){
            this.setOther((float)0);
        }
        if(this.getBonus()==null){
            this.setBonus((float)0);
        }
        if(this.getPenalty()==null){
            this.setPenalty((float)0);
        }

        float num = this.getBasic()+this.getEat()+this.getHouse()+this.getOther()+this.getBonus()-this.getPenalty();
        DecimalFormat df = new DecimalFormat("0.00");
        df.setRoundingMode(RoundingMode.HALF_UP);
        return df.format(num);
    }
}
