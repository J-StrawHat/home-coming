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
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Collection;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value="用户的信息", description="")
@TableName("user")
public class User implements UserDetails,Serializable {
    @ApiModelProperty("用户id")
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户名")
    @TableField("username")
    private String username;

    @ApiModelProperty("用户密码")
    @TableField("password")
    private String password;

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
    @TableField("address_city")
    private String city;

    @ApiModelProperty("地址的县")
    @TableField("address_county")
    private String county;

    @ApiModelProperty("地址的乡镇")
    @TableField("address_town")
    private String town;

    @ApiModelProperty("详细地址")
    @TableField("address_detail")
    private String detail;

    @ApiModelProperty("用户的角色")
    @TableField(exist = false)
    private Role role;

    @ApiModelProperty("创建的时间")
    @TableField("createTime")
    private LocalDate createTime;

    @ApiModelProperty("修改的时间")
    @TableField("updateTime")
    private LocalDate updateTime;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }



    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
