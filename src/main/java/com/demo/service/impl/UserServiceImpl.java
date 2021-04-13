package com.demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.config.sercurity.JwtTokenUtil;
import com.demo.mapper.UserMapper;
import com.demo.pojo.RespBean;
import com.demo.pojo.Role;
import com.demo.pojo.User;
import com.demo.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public User getUserByUserName(String username) {
        return  userMapper.selectOne(new QueryWrapper<User>().eq("username",username)) ;
    }

    @Override
    public Role getRoles(Integer id) {
        return userMapper.getRoles(id);
    }

    @Override
    public RespBean login(String username, String password,String code, HttpServletRequest request) {
    //验证码
        String captcha = (String) request.getSession().getAttribute("captcha");
        System.out.println(captcha);
        if(code==null||!captcha.equalsIgnoreCase(code))
        {
            return RespBean.error("验证码输入错误,请重新输入");
        }
        //登录

        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        System.out.println(new BCryptPasswordEncoder().encode("123456"));

        if(null==userDetails||!passwordEncoder.matches(password,userDetails.getPassword()))
        {
            return RespBean.error("用户名或密码错误");
        }
        //更新security登录的用户对象
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                userDetails,null,userDetails.getAuthorities()
        );
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);


        //生成token
        String token = jwtTokenUtil.generateToken(userDetails);
        Map<String,String> tokenMap=new HashMap<>();
        tokenMap.put("token",token);
        tokenMap.put("tokenHead",tokenHead);
        return RespBean.success("登录成功",tokenMap);
    }



}

