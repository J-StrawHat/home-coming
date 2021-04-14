package com.demo.controller;


import com.demo.pojo.RespBean;
import com.demo.pojo.User;
import com.demo.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "用户注册模块接口规范说明")
public class RegisterController {
    @Autowired
    private IUserService userService;

    @ApiOperation("注册用户")
    @PostMapping("/register")
    public RespBean registerUser(@RequestBody User user){
        if(userService.hasUsed(user.getUsername())){
            return RespBean.error("用户名已经被注册");
        }
        else {
            userService.insert(user);
            return RespBean.success("注册成功");
        }
    }
}
