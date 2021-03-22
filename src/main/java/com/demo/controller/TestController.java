package com.demo.controller;

import com.demo.pojo.RespBean;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api("测试专用")
public class TestController {

    @ApiOperation("测试一号")
    @GetMapping("/test")
    public RespBean test()
    {
        return RespBean.success("我是测试类");
    }
}
