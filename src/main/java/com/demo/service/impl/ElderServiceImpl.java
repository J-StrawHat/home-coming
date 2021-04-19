package com.demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.mapper.ElderMapper;

import com.demo.pojo.Elder;
import com.demo.pojo.MissingType;
import com.demo.service.IElderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ElderServiceImpl extends ServiceImpl<ElderMapper, Elder> implements IElderService {

    @Autowired
    ElderMapper elderMapper;
    @Override
    public Elder getElderByElderName(String name) {
        QueryWrapper <Elder> wrapper = new QueryWrapper<>();
        wrapper.like(name,name);
        return elderMapper.selectOne(wrapper);
    }

    @Override
    public MissingType getMissingType(Integer id) {
        return elderMapper.getMissingType(id);
    }

    @Override
    public List<Elder> getAllElderInfo() {
        return elderMapper.getAllElderInfo();
    }

    @Override
    public Elder getElderById(Integer id) {
        return elderMapper.getElderById(id);
    }

    @Override
    public Integer update(Elder elder) {
        return elderMapper.updateById(elder);
    }

    @Override
    public Integer deleteById(Integer id) {
        return elderMapper.deleteById(id);
    }

    @Override
    public Integer insert(Elder elder) {
        return elderMapper.insert(elder);
    }



}
