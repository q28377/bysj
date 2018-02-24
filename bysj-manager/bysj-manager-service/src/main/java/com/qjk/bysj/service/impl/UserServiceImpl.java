package com.qjk.bysj.service.impl;

import com.qjk.bysj.dao.UserCustomMapper;
import com.qjk.bysj.dao.UserMapper;
import com.qjk.bysj.pojo.po.User;
import com.qjk.bysj.pojo.po.UserExample;
import com.qjk.bysj.pojo.vo.UserQuery;
import com.qjk.bysj.service.UserService;
import dto.Order;
import dto.Page;
import dto.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserCustomMapper userCustomMapper;

    @Override
    public Result<User> listUserByPage(Page page, Order order, UserQuery query) {
        Result<User> result = null;
        try {
            //0 创建一个Map封装前台传递过来的参数
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", page);
            map.put("order", order);
            map.put("query", query);
            //1 创建一个响应参数实体类
            result = new Result<User>();
            //2 对total进行设值(符合条件的总记录数)
            int total = userCustomMapper.countUser(map);
            result.setTotal(total);
            //3 对rows进行设值(指定页码显示记录集合)
            List<User> list = userCustomMapper.listUserByPage(map);
            result.setRows(list);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int saveUser(User user) {
        int i = 0;
        try{

            UserExample userExample=new UserExample();
            UserExample.Criteria criteria=userExample.createCriteria();
            criteria.andUsernameEqualTo(user.getUsername());

            List<User> list = userMapper.selectByExample(userExample);
           if(list.size()==0){
                i = userMapper.insert(user);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
