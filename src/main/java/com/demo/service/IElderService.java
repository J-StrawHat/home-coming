package com.demo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.pojo.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IElderService extends IService<Elder> {
    //根据老人姓名进行模糊查询
    Elder getElderByElderName(String name);

    //根据老人id获取失踪类型
    MissingType getMissingType (Integer id);
    //查询所有老人的信息
    List<Elder> getAllElderInfo();
    //查询单个老人信息
    Elder getElderById(Integer id);

    Integer update(Elder elder);

    Integer deleteById(Integer id);

    Integer insert(Elder elder);
}
