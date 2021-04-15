package com.demo.pojo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value="老人走失类型", description="如：离家出走、迷路走失等")
public class MissingType {
    @ApiModelProperty("走失类型ID")
    @TableId(type = IdType.AUTO,value = "id")
    private Integer id;

    @ApiModelProperty("走失类型名称")
    @TableField("miss_typeName")
    private String missTypeName;
}
