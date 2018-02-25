package com.qjk.bysj.pojo.vo;

import com.qjk.bysj.pojo.po.Staff;

public class StaffCustom extends Staff{
    private String join;
    private String exit;
    private String brith;
    private String dname;

    public String getJoin() {
        return join;
    }

    public void setJoin(String join) {
        this.join = join;
    }

    public String getBrith() {
        return brith;
    }

    public void setBrith(String brith) {
        this.brith = brith;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getExit() {
        return exit;
    }

    public void setExit(String exit) {
        this.exit = exit;
    }
}
