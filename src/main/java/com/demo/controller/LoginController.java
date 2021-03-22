package com.demo.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.mapper.IUserMapper;
import com.demo.pojo.RespBean;
import com.demo.pojo.User;
import com.demo.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "用户登陆模块接口规范说明")
public class LoginController {

    @Autowired
    IUserService userService;

    @PostMapping("/login")
    @ApiOperation(value = "用户账号与密码匹配的登录方法",
            notes = "")
    public RespBean Login(String username,String password) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        User user = null;
        user = userService.getOne(queryWrapper.eq("userName", username).eq("userPassword", password), false);
        if(user != null){
            return RespBean.success("登陆成功!", user);
        }
        else {
            return RespBean.error("密码错误或者用户名未注册!", null);
        }
    }
}
