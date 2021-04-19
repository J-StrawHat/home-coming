package com.demo.controller;

import com.demo.pojo.Elder;
import com.demo.pojo.RespBean;
import com.demo.service.IElderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api("老人增删查改")
public class ElderController {
    @Autowired
    private IElderService elderService;

    @ApiOperation("查询所有老人的信息")
    @GetMapping("/Elder")
    public List<Elder> getAllUserInfo(){
        return elderService.getAllElderInfo();
    }

    @ApiOperation("查询单个id的老人")
    @GetMapping("/getELderById/{id}")
    public Elder getELderById(@PathVariable("id") Integer id){
        return elderService.getElderById(id);
    }


    @ApiOperation("添加一个老人记录")
    @PostMapping("/Elder")
    public RespBean insertElder(@RequestBody Elder elder){
        int res = elderService.insert(elder);
        if(res > 0){
            return RespBean.success("插入成功");
        }
        else {
            return RespBean.error("插入失败");
        }
    }

    @ApiOperation("删除一个老人记录")
    @DeleteMapping("/Elder/{id}")
    public RespBean deleteElder(@PathVariable("id") Integer id){
        int res = elderService.deleteById(id);
        if(res > 0){
            return RespBean.success("删除成功");
        }
        else {
            return RespBean.error("删除失败");
        }
    }

    @ApiOperation("修改一个老人信息")
    @PutMapping("/Elder")
    public RespBean setUserInfo(@RequestBody Elder elder){
        int res = elderService.update(elder);
        if(res > 0){
            return RespBean.success("修改成功");
        }
        else {
            return RespBean.error("修改失败");
        }
    }
    @ApiOperation("老人信息分页查询")
    @GetMapping("/ElderPage/{p}")
    public PageInfo setUserInfo(@PathVariable("p") Integer p){
        PageHelper.startPage(p,6);
        List<Elder> allElderInfo = elderService.getAllElderInfo();
        PageInfo pageInfo = new PageInfo(allElderInfo);
        return  pageInfo;

    }
}
