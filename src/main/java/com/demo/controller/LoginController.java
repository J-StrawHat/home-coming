package com.demo.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.pojo.RespBean;
import com.demo.pojo.Role;
import com.demo.pojo.User;
import com.demo.pojo.UserLoginParam;
import com.demo.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@RestController
@Api(tags = "用户登陆模块接口规范说明")
public class LoginController {

    @Autowired
    private IUserService userService;


    @ApiOperation(value = "登录之后返回的token")
    @PostMapping("/login")
    public RespBean login(@RequestBody UserLoginParam userLoginParam, HttpServletRequest request)
    {
        return userService.login(userLoginParam.getUsername(),userLoginParam.getPassword(),userLoginParam.getCode(),request);
    }

    @ApiOperation(value = "获取当前登录用户的信息")
    @GetMapping("/user/info")
    public User getAdminInfo(Principal principal)
    {
        if(null==principal)
        {
            return null;
        }
        String username=principal.getName();
        User user=userService.getUserByUserName(username);
        user.setPassword(null);
        Role roles = userService.getRoles(user.getId());
        System.out.println(roles);
        user.setRole(roles);
        return user;
    }




    @ApiOperation(value = "退出登录")
    @PostMapping("/logout")
    public RespBean logout()
    {
        return RespBean.success("注销成功");
    }
}
