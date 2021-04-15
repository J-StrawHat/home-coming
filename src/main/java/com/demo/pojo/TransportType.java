package com.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value="交通出行类型", description="如：步行、自行车等")
public class TransportType {
    @ApiModelProperty("交通出行id")
    @TableId(type = IdType.AUTO,value = "id")
    private Integer id;

    @ApiModelProperty("交通出行方式的名称")
    @TableField("name")
    private String name;
}
