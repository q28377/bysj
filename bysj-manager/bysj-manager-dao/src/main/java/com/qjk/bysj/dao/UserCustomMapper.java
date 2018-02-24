package com.qjk.bysj.dao;

import com.qjk.bysj.pojo.po.User;

import java.util.List;
import java.util.Map;

public interface UserCustomMapper {
    int countUser(Map<String, Object> map);
    List<User> listUserByPage(Map<String, Object> map);
}
