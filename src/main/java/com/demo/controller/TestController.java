package com.demo.controller;

import com.demo.mapper.UserMapper;
import com.demo.pojo.RespBean;
import com.demo.pojo.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Api("测试专用")
public class TestController {

    @Autowired
    private UserMapper userMapper;

    @ApiOperation("获取所有用户信息")
    @GetMapping("/User")
    public List<User> getUserAllInfo()
    {
        List<User> users = userMapper.selectList(null);
        return users;
    }
    @ApiOperation("添加用户")
    @PostMapping ("/User")
    public RespBean insertUser(@RequestBody User user)
    {
        System.out.println(user);
        int i = userMapper.insert(user);
        if (i>0)
        {
            return RespBean.success("插入成功");
        }
        else {
            return RespBean.error("插入失败");
        }

    }
}
