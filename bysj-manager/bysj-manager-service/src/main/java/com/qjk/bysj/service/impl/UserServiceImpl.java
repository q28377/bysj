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
            criteria.andUsernameEqualTo(user.getUsername());//用户名重复
            criteria.andStatusEqualTo(1);//用户未被删除

            List<User> list = userMapper.selectByExample(userExample);
            //不能有重复的未删除的用户名
           if(list.size()==0){
                i = userMapper.insert(user);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int deleteBatch(List ids) {
        int i=0;
        try {
            for(int j=0;j<ids.size();j++) {
                //System.out.println(ids.get(i));
                User user = null;
                int id = Integer.parseInt((String) ids.get(i));
                user = userMapper.selectByPrimaryKey(id);
                user.setStatus(0);

                //创建更新模板
                UserExample example = new UserExample();
                UserExample.Criteria criteria = example.createCriteria();
                criteria.andUidEqualTo(id);
                //执行
                i += userMapper.updateByExample(user, example);
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public User selectById(int uid) {
        User user = null;
        try {
            user = userMapper.selectByPrimaryKey((Integer) uid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int updateUser(User user) {
        int i = 0 ;
        try {
            //创建更新模板
            UserExample example = new UserExample();
            UserExample.Criteria criteria = example.createCriteria();
            criteria.andUidEqualTo(user.getUid());
            //执行
            i = userMapper.updateByExample(user,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public User findByUsername(User user) {
        User u = null;
        try {
            UserExample example= new UserExample();
            UserExample.Criteria criteria = example.createCriteria();
            criteria.andUsernameEqualTo(user.getUsername());
            criteria.andStatusEqualTo(1);

            u = userMapper.selectByExample(example).get(0);

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }

        return u;
    }
}
