package com.demo.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.mapper.UserMapper;
import com.demo.pojo.RespBean;
import com.demo.pojo.Role;
import com.demo.pojo.User;
import com.demo.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@Api("后台用户增删查改")
public class UserController {
    @Autowired
    private IUserService userService;

    @ApiOperation("查询所有用户的信息")
    @GetMapping("/User")
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
    @PostMapping("/User")
    public RespBean insertUser(@RequestBody User user){
        user.setUpdateTime(LocalDate.now());
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        int res = userService.insert(user);
        if(res > 0){
            return RespBean.success("注册成功");
        }
        else {
            return RespBean.error("注册失败");
        }
    }

    @ApiOperation("删除一个用户记录")
    @DeleteMapping("/User")
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
    @PutMapping("/User")
    public RespBean setUserInfo(@RequestBody User user){
       user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()) );
        int res = userService.update(user);
        if(res > 0){
            return RespBean.success("修改成功");
        }
        else {
            return RespBean.error("修改失败");
        }
    }
    @ApiOperation("返回分页用户信息")
    @GetMapping("/UserPage/{p}")
    public PageInfo setUserInfo(@PathVariable("p") Integer p ){
        PageHelper.startPage(p,6);
        List<User> allUserInfo = userService.getAllUserInfo();
        PageInfo pageInfo = new PageInfo(allUserInfo);
        return pageInfo;
    }
}
