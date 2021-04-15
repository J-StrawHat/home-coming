package com.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.pojo.Role;
import com.demo.pojo.User;
import io.swagger.annotations.ApiModel;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@ApiModel(value="用户数据访问类", description="包括家属、队员、管理员")
public interface UserMapper extends BaseMapper<User> {
    //根据用户id获取角色
    Role getRoles(Integer id);
    //查询所有用户
    List<User> getAllUserInfo();
    //查询单个用户
    User getUserById(Integer id);
}
