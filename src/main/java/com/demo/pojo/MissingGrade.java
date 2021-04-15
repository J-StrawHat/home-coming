package com.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value="老人走失等级", description="")
public class MissingGrade {
    @ApiModelProperty("走失等级ID")
    @TableId(type = IdType.AUTO,value = "id")
    private Integer id;

    @ApiModelProperty("走失等级名称")
    @TableField("grade_name") //此处要检查下你的本地数据库grade表中的grade_name是否对应
    private String missingGradeName;
}
