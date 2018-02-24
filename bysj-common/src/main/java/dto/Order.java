package dto;

import java.util.ArrayList;
import java.util.List;

/**
 * easyui的datagrid排序通用类
 * User: DHC
 * Date: 2017/11/9
 * Time: 10:07
 * Version:V1.0
 */
public class Order {

    private String sort;
    private String order;

    public List<String> getOrderParams() {
        String[] sorts = sort.split(",");
        String[] orders = order.split(",");
        List<String> list = new ArrayList<String>();
        for (int i=0;i< sorts.length;i++){
            String temp = sorts[i] + " " + orders[i];
            list.add(temp);
        }
        return list;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }
}
