package com.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value="用户的角色", description="")
public class Role {

    @ApiModelProperty("角色的id")
    @TableId(type = IdType.AUTO,value = "id")
    private Integer id;

    @ApiModelProperty("角色的名称")
    @TableField("roleName")
    private String roleName;
}
