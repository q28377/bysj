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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

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
    @RequestMapping("/user-editor")
    public String userEditor(){
        return "user-editor";
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

    //批量删除用户（修改用户状态为0）
    @ResponseBody
    @RequestMapping(value = "/user/batch", method = RequestMethod.POST)
    public int deleteBatch(@RequestParam("ids[]")List ids){
        int i = 0;
        try {
            i = userService.deleteBatch(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //点击编辑按钮，查询当前选中项相关信息，数据回显到修改页面
    @RequestMapping("/user/update/{uid}")
    public String getReginsById(@PathVariable("uid")Integer uid, Model model){

        User user = null;
        try {
            user = userService.selectById(uid);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        model.addAttribute("user",user);
        //修改页面的视图
        return "user-editor";
    }

    //编辑的提交
    @ResponseBody
    @RequestMapping(value="/user/update",method = RequestMethod.POST)
    public int updateUser(User user){
        int i = 0;
        try {
            i = userService.updateUser(user);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return  i;
    }
}
