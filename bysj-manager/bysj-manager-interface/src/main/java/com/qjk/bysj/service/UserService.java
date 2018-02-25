package com.qjk.bysj.service;

import com.qjk.bysj.pojo.po.User;
import com.qjk.bysj.pojo.vo.UserQuery;
import dto.Order;
import dto.Page;
import dto.Result;

import java.util.List;

public interface UserService {

    Result<User> listUserByPage(Page page, Order order, UserQuery query);
    int saveUser(User user);
    int deleteBatch(List ids);
    User selectById(int uid);
    int updateUser(User user);
}
