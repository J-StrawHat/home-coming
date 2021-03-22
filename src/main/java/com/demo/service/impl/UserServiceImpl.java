package com.demo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.mapper.IUserMapper;
import com.demo.pojo.User;
import com.demo.service.IUserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<IUserMapper, User>
                            implements IUserService {

}
