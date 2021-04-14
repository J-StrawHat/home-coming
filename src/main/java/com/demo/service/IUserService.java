package com.demo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.pojo.RespBean;
import com.demo.pojo.Role;
import com.demo.pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IUserService extends IService<User> {
    User getUserByUserName(String username);

    //根据用户id获取角色
    Role getRoles(Integer id);

    //登录之后返回的token
    RespBean login(String username, String password,String code, HttpServletRequest request);


    List<User> getAllUserInfo();

    User getUserById(int id);

    Integer insert(User user);

    Integer update(User user);

    Integer deleteById(int id);

    Boolean hasUsed(String username);
}
