package com.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value="用户的信息", description="")
@TableName("user")
public class User {
    @ApiModelProperty("用户id")
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户名")
    @TableField("userName")
    private String userName;

    @ApiModelProperty("用户密码")
    @TableField("userPassword")
    private String userPassword;

    @ApiModelProperty("性别")
    @TableField("gender")
    private String gender;

    @ApiModelProperty("年龄")
    @TableField("age")
    private Integer age;

    @ApiModelProperty("出生日期")
    @TableField("birthday")
    private LocalDate birthday;

    @ApiModelProperty("电话号码")
    @TableField("phone")
    private String phone;

    @ApiModelProperty("地址的省份")
    @TableField("address_province")
    private String province;

    @ApiModelProperty("地址的市")
    @TableField("address_province")
    private String city;

    @ApiModelProperty("地址的县")
    @TableField("address_province")
    private String county;

    @ApiModelProperty("地址的乡镇")
    @TableField("address_town")
    private String town;

    @ApiModelProperty("详细地址")
    @TableField("address_desc")
    private String desc;

    @ApiModelProperty("用户的角色")
    @TableField(exist = false)
    private Role role;

    @ApiModelProperty("创建的时间")
    @TableField("creatDate")
    private LocalDate createTime;

    @ApiModelProperty("修改的时间")
    @TableField("modifyDate")
    private LocalDate updateTime;

}
