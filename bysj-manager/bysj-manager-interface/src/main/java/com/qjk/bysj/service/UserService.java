package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.User;
import com.qjk.bysj.pojo.vo.UserQuery;
import dto.Order;
import dto.Page;
import dto.Result;

public interface UserService {

    Result<User> listUserByPage(Page page, Order order, UserQuery query);
    int saveUser(User user);
}
