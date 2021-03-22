package com.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.pojo.User;
import io.swagger.annotations.ApiModel;

@ApiModel(value="用户数据访问类", description="包括家属、队员、管理员")
public interface IUserMapper extends BaseMapper<User> {
}
