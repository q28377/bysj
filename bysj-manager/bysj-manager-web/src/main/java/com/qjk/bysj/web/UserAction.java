package com.qjk.bysj.web;

import com.qjk.bysj.pojo.po.User;
import com.qjk.bysj.pojo.vo.UserQuery;
import com.qjk.bysj.service.UserService;
import dto.Order;
import dto.Page;
import dto.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@Scope("prototype")
public class UserAction {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;

    //访问首页
    @RequestMapping("/")    //根据配置文件，解析访问到WEB-INF/jsp下的index.jsp
    public String index(){
        return "index";
    }

    //访问user-list
    @RequestMapping("/user-list")
    public String userList(){
        return "user-list";
    }
    @RequestMapping("/user-list2")
    public String userList2(){
        return "user-list2";
    }
    @RequestMapping("/user-add")
    public String userAdd(){
        return "user-add";
    }

    //分页查询用户
    @ResponseBody
    @RequestMapping(value = "/user/query", method = RequestMethod.POST)
    public Result<User> listUserByPage(Page page, Order order, UserQuery query){
        Result<User> list = null;
        try{
            list = userService.listUserByPage(page,order,query);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return list;
    }

    //新增用户
    @ResponseBody
    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public int saveUser(User user){
        user.setStatus(1);
        user.setCreatetime(new Date());
        int i = 0;
        try{
            i = userService.saveUser(user);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
