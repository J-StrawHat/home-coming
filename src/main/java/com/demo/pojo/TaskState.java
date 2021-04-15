package com.demo.pojo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@ApiModel(value = "任务当前状态标识", description="正在进行、已找到、已结束、未开始四种状态")
public class TaskState {
    @ApiModelProperty("任务状态id")
    @TableId(type = IdType.AUTO,value = "id")
    private Integer id;

    @ApiModelProperty("任务状态名称")
    @TableField("state_name")
    private String stateName;
}
