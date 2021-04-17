package com.demo.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.pojo.Elder;
import com.demo.pojo.MissingType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ElderMapper extends BaseMapper<Elder> {
    //获取指定id走失老人的失踪类型
    MissingType getMissingType (Integer id);
    //查询所有老人的信息
    List<Elder> getAllElderInfo();
    //查询单个老人信息
    Elder getElderById(Integer id);
}
