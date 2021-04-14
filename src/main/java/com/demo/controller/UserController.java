package com.demo.controller;


import com.demo.mapper.UserMapper;
import com.demo.pojo.RespBean;
import com.demo.pojo.Role;
import com.demo.pojo.User;
import com.demo.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api("后台用户增删查改")
public class UserController {
    @Autowired
    private IUserService userService;

    @ApiOperation("查询所有用户的信息")
    @GetMapping("/allUsers")
    public List<User> getAllUserInfo(){
        return userService.getAllUserInfo();
    }

    @ApiOperation("查询单个id的用户")
    @GetMapping("/getUserById")
    public User getUserById(int id){
        return userService.getUserById(id);
    }

    @ApiOperation("查询当前id用户所属角色")
    @GetMapping("/getUserRole")
    public String getUserRole(int id){
        Role userRole = userService.getRoles(id);
        return userRole.getRoleName();
    }

    @ApiOperation("添加一个用户记录")
    @PostMapping("/addUser")
    public RespBean insertUser(@RequestBody User user){
        int res = userService.insert(user);
        if(res > 0){
            return RespBean.success("插入成功");
        }
        else {
            return RespBean.error("插入失败");
        }
    }

    @ApiOperation("删除一个用户记录")
    @DeleteMapping("/deleteUser")
    public RespBean deleteUser(int id){
        int res = userService.deleteById(id);
        if(res > 0){
            return RespBean.success("删除成功");
        }
        else {
            return RespBean.error("删除失败");
        }
    }

    @ApiOperation("修改一个用户信息")
    @PutMapping("/setUserInfo")
    public RespBean setUserInfo(@RequestBody User user){
        int res = userService.update(user);
        if(res > 0){
            return RespBean.success("修改成功");
        }
        else {
            return RespBean.error("修改失败");
        }
    }


}
